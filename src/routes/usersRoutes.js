import { findById } from "../controllers/usersControllers.js";
import { authSessionValidation } from "../middlewares/authValidationMiddleware.js";

import { Router } from "express";

const router = Router();

router.get("/users/me", authSessionValidation, findById);

export default router;
