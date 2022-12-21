import { findAll } from "../controllers/usersControllers.js";
import { authSessionValidation } from "../middlewares/authValidationMiddleware.js";

import { Router } from "express";

const router = Router();

router.get("/users/me", authSessionValidation, findAll);

export default router;
