const { Router } = require("express");

const { pool } = require("../database");

const endpoint = Router();

endpoint.post("/login", async (req, res) => {
  const { boleta, password } = req.body;

  try {
    const [rows] = await pool
      .promise()
      .query("SELECT * FROM students Where boleta = ? AND pwd = ?", [
        boleta,
        password,
      ]);

    if (rows.length <= 0)
      return res.status(404).json({
        status: "denied",
        message: "Boleta or Password is  incorrect",
      });

    const user = rows[0];
    console.log(user);

    return res.json({ status: "accepted", user });
  } catch (e) {
    return res
      .status(500)
      .json({ status: "error", message: "Something goes wrong", e });
  }
});

module.exports = endpoint;
