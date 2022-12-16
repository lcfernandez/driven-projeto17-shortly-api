import { signUp } from "../controllers/authControllers.js";

import { userSchemaValidation } from "../middlewares/authValidationMiddleware.js";

import { Router } from "express";

const router = Router();

router.post("/signup", userSchemaValidation, signUp);

export default router;
