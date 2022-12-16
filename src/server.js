import authRoutes from "./routes/authRoutes.js";

import dotenv from "dotenv";
import express from "express";

// TODO: remove after db creation
export const users = [];

// instance of express
const app = express();

//configs
app.use(express.json());
app.use(authRoutes);
dotenv.config();

const port = process.env.PORT || 4000;
app.listen(port, () => console.log(`Server running on port ${port}`));
