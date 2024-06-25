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

endpoint.put("/update/:boleta", async (req, res) => {
  const { boleta } = req.params;
  const { curso, state } = req.body;

  try {
    const [result] = await pool
      .promise()
      .query(
        "SELECT * FROM student_courses WHERE student_idStudent = ? AND course_idCourse = ?",
        [boleta, curso]
      );

    console.log(result);

    if (result.length === 0 && state !== null) {
      const [rows] = await pool
        .promise()
        .query(
          "INSERT INTO student_courses (student_idStudent, course_idCourse, state) VALUES (?, ?, ?)",
          [boleta, curso, state]
        );
      console.log(rows);
      res.status(200).json({
        msg: "insertado",
      });
    } else {
      const query =
        state === null
          ? "DELETE FROM student_courses WHERE student_idStudent = ? AND course_idCourse = ?"
          : "UPDATE student_courses SET state = ? WHERE student_idStudent = ? AND course_idCourse = ?";
      if (state === null) {
        const [rows] = await pool.promise().query(query, [boleta, curso]);
        console.log(rows);
        res.status(200).json({
          msg: "eliminado",
        });
      } else {
        const [rows] = await pool
          .promise()
          .query(query, [state, boleta, curso]);
        console.log(rows);
        res.status(200).json({
          msg: "actualizado",
        });
      }
    }
  } catch (err) {
    res.status(404).json({
      err,
    });
  }
});

module.exports = endpoint;
