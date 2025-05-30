const express = require("express");
const app = express();
const helmet = require("helmet");
const cors = require("cors");

const authRoutes = require("./routes/auth.routes");
const userRoutes = require("./routes/user.routes");
const postRoutes = require("./routes/post.routes");
const commentRoutes = require("./routes/comment.routes");
const likeRoutes = require("./routes/like.routes");

app.use(cors());
app.use(helmet());
app.use(express.json());

//-------Routes---------------

// app.use((req, res, next) => {
//   if (req.method !== "GET") {
//     return res
//       .status(403)
//       .json({ message: "Mode démo : écriture désactivée." });
//   }
//   next();
// });

app.use((req, res, next) => {
  const allowedPaths = ["/api/auth/login"];
  if (req.method !== "GET" && !allowedPaths.includes(req.path)) {
    return res
      .status(403)
      .json({ message: "Mode démo : écriture désactivée." });
  }
  next();
});

app.use("/api/auth", authRoutes);
app.use("/api/user", userRoutes);
app.use("/api/post", postRoutes);
app.use("/api/comment", commentRoutes);
app.use("/api/like", likeRoutes);

module.exports = app;
