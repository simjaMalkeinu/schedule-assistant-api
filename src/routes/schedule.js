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
  const { boleta } = req.params;
  const {
    carga,
    turno,
    cultural_act,
    deportive_act,
    free_time,
    ss_time,
    pp_time,
    w_time,
  } = req.body;

  try {
    // For pool initialization, see above
    const [rows] = await pool
      .promise()
      .query(
        "select s.*, g.name as `group`, concat(t.name, ' ', t.ape_pat,' ',ape_mat) as profesor, c.name as asignatura from schedules s, `groups` g, teachers t, courses c where (s.group_idgroup = g.idgroup AND s.course_idCourse = c.idcourse AND s.teacher_idTeacher = t.idteacher) AND s.course_idCourse in (?);",
        []
      );
    // Connection is automatically released when query resolves

    res.status(200).json({
      boleta,
      carga,
      turno,
      cultural_act,
      deportive_act,
      free_time,
      ss_time,
      pp_time,
      w_time,
    });


  } catch (err) {
    res.status(404).json({
      err,
    });
  }

  
});

module.exports = endpoint;
