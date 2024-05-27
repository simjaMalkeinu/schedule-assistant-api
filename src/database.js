const {createPool} = require("mysql2/promise");

const {
  DB_HOST,
  DB_DATABASE,
  DB_PASSWORD,
  DB_PORT,
  DB_USER,
} = require("./utils/config");

const pool = createPool({
  host: DB_HOST,
  database: DB_DATABASE,
  user: DB_USER,
  password: DB_PASSWORD,
  port: DB_PORT,
  ssl: {
    rejectUnauthorized: false,
  },
});

module.exports = pool;
