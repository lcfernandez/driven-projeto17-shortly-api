import { findById, shorten } from "../controllers/urlController.js";
import { authSessionValidation } from "../middlewares/authValidationMiddleware.js";
import { urlSchemaValidation } from "../middlewares/urlValidationMiddleware.js";

import { Router } from "express";

const router = Router();

router.get("/urls/:id", findById);
router.post("/urls/shorten", authSessionValidation, urlSchemaValidation, shorten);

export default router;
