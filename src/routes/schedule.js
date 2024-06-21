const { Router } = require("express");

const { pool } = require("../database");

const endpoint = Router();

const TOTAL_CREDITS = 362;

endpoint.get("/:boleta", async (req, res) => {
  const { boleta } = req.params;

  try {
    // For pool initialization, see above
    const [rows] = await pool
      .promise()
      .query(
        "select  c.*, sc.state from courses c LEFT JOIN student_courses sc ON c.idcourse = sc.course_idcourse AND sc.student_idstudent = ?",
        [boleta]
      );
    // Connection is automatically released when query resolves

    const map = [];
    let credits = 0;
    let student_state = "REGULAR";
    let min_period = 0;

    rows.map((c) => {
      const periodo = map.findIndex((p) => p.num === c.period);

      if (periodo === -1) {
        map.push({
          num: c.period,
          courses: [c],
        });
      } else {
        if (c.type !== "OPTATIVA") {
          map[periodo].courses.push(c);
        }
      }

      if (c.state === 1) {
        credits += c.credits;
        if (c.period > min_period && student_state === "REGULAR") {
          min_period = c.period;
        }
      }

      if (c.state === 0) {
        student_state = "IRREGULAR";
        if (c.period < min_period && min_period !== 0) {
          min_period = c.period;
        } else if (min_period === 0) {
          min_period = c.period;
        }
      }
    });

    const [optatives] = await pool
      .promise()
      .query(
        "SELECT c.idcourse, c.name, c.type AS course_type, c.credits, c.hours_per_week, c.hours_practice_per_week, c.period, IF(sc.state IS NOT NULL, sc.state, null) AS state FROM  courses c JOIN  course_lines cl ON c.idcourse = cl.Course_idCourse JOIN  `lines` l ON cl.Line_idLine = l.idline JOIN  students s ON s.line_idline = l.idline LEFT JOIN  student_courses sc ON c.idcourse = sc.course_idCourse AND s.boleta = sc.student_idStudent WHERE  s.boleta = ?;",
        [boleta]
      );

    optatives.map((c) => {
      map[c.period - 1].courses.push(c);
    });

    const percentage_credits = ((credits / TOTAL_CREDITS) * 100).toFixed(2);

    res.status(200).json({
      kardex: map.reverse(),
      credits,
      percentage_credits,
      student_state,
      social_service: percentage_credits > 75 ? true : false,
      practice_program: percentage_credits > 50 ? true : false,
      min_period,
      max_period: min_period + 2,
    });
  } catch (err) {
    res.status(404).json({
      err,
    });
  }
});

endpoint.post("/:boleta", async (req, res) => {
  const {
    carga,
    turno,
    cultural_act,
    deportive_act,
    free_time,
    ss_time,
    pp_time,
    w_time,
    list_courses,
  } = req.body;

  try {
    // For pool initialization, see above
    const [rows] = await pool
      .promise()
      .query(
        "select s.*, g.name as `group`, concat(t.name, ' ', t.ape_pat,' ',ape_mat) as profesor, c.name as asignatura from schedules s, `groups` g, teachers t, courses c where (s.group_idgroup = g.idgroup AND s.course_idCourse = c.idcourse AND s.teacher_idTeacher = t.idteacher) AND s.course_idCourse in (?);",
        [[...list_courses.prioritary, ...list_courses.others]]
      );
    // Connection is automatically released when query resolves
    console.log(rows.length);

    let schedules = [];

    if (turno !== "MX") {
      schedules = rows.filter(
        (s) =>
          s.shift === turno ||
          list_courses.prioritary.includes(s.course_idCourse)
      );
    }

    schedules.forEach((s) => {
      s.monday = s.monday.split("-");
      s.tuesday = s.tuesday.split("-");
      s.wednesday = s.wednesday.split("-");
      s.thursday = s.thursday.split("-");
      s.friday = s.friday.split("-");
    });

    if (free_time) {
      schedules = filtrarDatos(schedules, free_time, list_courses.prioritary);
    }
    if (ss_time) {
      schedules = filtrarDatos(schedules, ss_time, list_courses.prioritary);
    }
    if (pp_time) {
      schedules = filtrarDatos(schedules, pp_time, list_courses.prioritary);
    }
    if (w_time) {
      schedules = filtrarDatos(schedules, w_time, list_courses.prioritary);
    }
    if (cultural_act) {
      schedules = filtrarDatos(schedules, w_time, list_courses.prioritary);
    }
    if (deportive_act) {
      schedules = filtrarDatos(schedules, w_time, list_courses.prioritary);
    }

    // schedules = groupByCourseId(schedules);

    const schedulesGenerated = getValidCombinations(schedules, carga, list_courses.prioritary)
    // console.log(getValidCombinations(schedules, 2));
    // console.log(groupedByCourseId);

    res.status(200).json({
      schedulesGenerated
    });
  } catch (err) {
    res.status(404).json({
      err,
    });
  }
});

function checkTimeOverlap(schedule1, schedule2) {
  const days = ["monday", "tuesday", "wednesday", "thursday", "friday"];

  for (const day of days) {
    const times1 = schedule1[day];
    const times2 = schedule2[day];

    if (times1.length > 1 || times2.length > 1) {
      for (let i = 0; i < times1.length; i += 2) {
        for (let j = 0; j < times2.length; j += 2) {
          const start1 = times1[i];
          const end1 = times1[i + 1];
          const start2 = times2[j];
          const end2 = times2[j + 1];

          if (start1 && start2 && end1 && end2) {
            if (start1 < end2 && start2 < end1) {
              return true;
            }
          }
        }
      }
    }
  }
  return false;
}

function schedulesOverlap(schedules) {
  for (let i = 0; i < schedules.length; i++) {
    for (let j = i + 1; j < schedules.length; j++) {
      if (checkTimeOverlap(schedules[i], schedules[j])) {
        // console.log(
        //   `Overlap found between schedules ${schedules[i].idschedule} and ${schedules[j].idschedule}`
        // );
        return true;
      }
    }
  }
  return false;
}

function generateCombinations(arr, size, priorityCourses) {
  const result = [];

  function helper(temp, start) {
    if (temp.length === size) {
      if (priorityCourses.every(course => temp.some(schedule => schedule.course_idCourse === course))) {
        result.push([...temp]);
      }
      return;
    }

    for (let i = start; i < arr.length; i++) {
      if (temp.some(schedule => schedule.course_idCourse === arr[i].course_idCourse)) {
        continue; // Evita cursos repetidos en la misma combinación
      }
      temp.push(arr[i]);
      helper(temp, i + 1);
      temp.pop();
    }
  }

  helper([], 0);
  return result;
}

function getValidCombinations(schedules, combinationSize, priorityCourses) {
  let allCombinations = generateCombinations(schedules, combinationSize, priorityCourses);
  let validCombinations = allCombinations.filter(combination => !schedulesOverlap(combination));
  return validCombinations;
}

function filtrarDatos(arreglo, valor, prioritary) {
  return arreglo.filter((s) => {
    let flag = true;
    if (!prioritary.includes(s.course_idCourse)) {
      if (s.monday[0] !== "") {
        if (!isFreeTimeValid(s.monday, valor)) {
          flag = false;
        }
      }
      if (s.tuesday[0] !== "") {
        if (!isFreeTimeValid(s.tuesday, valor)) {
          flag = false;
        }
      }
      if (s.wednesday[0] !== "") {
        if (!isFreeTimeValid(s.wednesday, valor)) {
          flag = false;
        }
      }
      if (s.thursday[0] !== "") {
        if (!isFreeTimeValid(s.thursday, valor)) {
          flag = false;
        }
      }
      if (s.friday[0] !== "") {
        if (!isFreeTimeValid(s.friday, valor)) {
          flag = false;
        }
      }
    }

    if (flag) {
      return s;
    }
  });
}

// Función para convertir una hora en formato "HH:MM" a minutos desde el inicio del día
function timeToMinutes(time) {
  const [hours, minutes] = time.split(":").map(Number);
  return hours * 60 + minutes;
}

// Función para verificar la superposición de intervalos
function isFreeTimeValid(tuesday, freeTime) {
  const freeStart = timeToMinutes(freeTime.start);
  const freeEnd = timeToMinutes(freeTime.end);

  for (let i = 0; i < tuesday.length; i += 2) {
    const tuesdayStart = timeToMinutes(tuesday[i]);
    const tuesdayEnd = timeToMinutes(tuesday[i + 1]);

    // Verificar si el tiempo libre se superpone con algún intervalo de martes
    if (freeStart < tuesdayEnd && freeEnd > tuesdayStart) {
      return false;
    }
  }
  return true;
}

module.exports = endpoint;
