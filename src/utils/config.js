require("dotenv").config();

const PORT = process.env.PORT || 3000;
const MYSQL_URI = process.env.MYSQL_URI || "localhost";

const DB_USER = process.env.DB_USER || "root";
const DB_PASSWORD = process.env.DB_PASSWORD || "root";
const DB_DATABASE = process.env.DB_DATABASE || "schedule_assistant";
const DB_PORT = process.env.DB_PORT || 3306;
const DB_HOST = process.env.DB_HOST || "localhost";

module.exports = {
  MYSQL_URI,
  PORT,
  DB_USER,
  DB_PASSWORD,
  DB_DATABASE,
  DB_PORT,
  DB_HOST,
};
