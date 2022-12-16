import dotenv from "dotenv";
import express from "express";

// instance of express
const app = express();
dotenv.config();

const port = process.env.PORT || 4000;
app.listen(port, () => console.log(`Server running on port ${port}`));
