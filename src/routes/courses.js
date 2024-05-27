const { Router } = require("express");

const { pool } = require("../database");

const endpoint = Router();

endpoint.get("/", async (req, res) => {
  try {
    // For pool initialization, see above
    const [rows] = await pool.promise().query("SELECT * FROM courses");
    // Connection is automatically released when query resolves

    const map = [];

    rows.map((c) => {
      const periodo = map.findIndex((p) => p.num === c.period);

      const curso = {
        idCourse: c.idcourse,
        name: c.name,
        tipo: c.type,
        creditos: c.credits,
        horasTeoricas: c.hours_per_week,
        horasPracticas: c.hours_practice_per_week,
      };

      if (periodo === -1) {
        map.push({
          num: c.period,
          courses: [curso],
        });
      } else {
        map[periodo].courses.push(curso);
      }
    });

    res.status(200).json({
      data: map,
    });
  } catch (err) {
    res.status(404).json({
      err,
    });
  }
});

module.exports = endpoint;
