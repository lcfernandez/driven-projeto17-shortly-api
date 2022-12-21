import { findById, open, remove, shorten } from "../controllers/urlController.js";
import { authSessionValidation } from "../middlewares/authValidationMiddleware.js";
import { urlOpenValidation, urlSchemaValidation, urlUserValidation } from "../middlewares/urlValidationMiddleware.js";

import { Router } from "express";

const router = Router();

router.delete("/urls/:id", authSessionValidation, urlUserValidation, remove);
router.get("/urls/:id", findById);
router.get("/urls/open/:shortUrl", urlOpenValidation, open);
router.post("/urls/shorten", authSessionValidation, urlSchemaValidation, shorten);

export default router;
