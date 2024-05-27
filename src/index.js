const config = require("./utils/config");
const logger = require("./utils/logger");
const app = require("./app");

app.set("port", config.PORT);

app.listen(app.get("port"), () => {
  logger.info("Server on port", app.get("port"));
});
