const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const notFound = require("./middleware/notFound");

// import loginRoutes from './routes/LogIn.routes.js'
const courses = require("./routes/courses");
const schedule = require("./routes/schedule");
const users = require("./routes/users");

// Initializations
const app = express();

// Middlewares
app.use(morgan("dev"));
app.use(express.json());
app.use(cors());

// Routes
// app.use('/', indexRoutes);
app.use("/courses", courses);
app.use("/schedule", schedule);
app.use("/users", users);

app.get("/", (request, response) => {
  console.log(request.ip);
  console.log(request.ips);
  console.log(request.originalUrl);
  response.send("<h1>Hello World!</h1>");
});

// route for responts when not exist
app.use(notFound);

module.exports = app;
