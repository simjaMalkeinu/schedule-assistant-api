const { Router } = require("express");

const { pool } = require("../database");

const endpoint = Router();

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
      }

      if (c.state === 0) {
        student_state = "IRREGULAR";
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

    res.status(200).json({
      kardex: map.reverse(),
      credits,
      percentage_credits: ((credits / 362) * 100).toFixed(2),
      student_state,
    });
  } catch (err) {
    res.status(404).json({
      err,
    });
  }
});

module.exports = endpoint;
