const express = require("express");
const app = express();
const port = 5000;
const cors = require("cors");
const videoRoutes = require("./app/routes/videoRoutes");

app.use(express.json());
app.use(cors());

// app.get("/", (req, res) => {
//   res.send("Welcome to my video service! testing");
// });

app.use("/", videoRoutes);

app.listen(port, '0.0.0.0', () => console.log(`Listening on port ${port}`));
