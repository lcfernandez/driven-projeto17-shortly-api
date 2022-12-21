import authRoutes from "./routes/authRoutes.js";
import urlRoutes from "./routes/urlRoutes.js";

import express from "express";

// instance of express
const app = express();

//configs
app.use(express.json());
app.use(authRoutes);
app.use(urlRoutes);

const port = process.env.PORT || 4000;
app.listen(port, () => console.log(`Server running on port ${port}`));
