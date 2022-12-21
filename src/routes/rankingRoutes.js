import { findTop10 } from "../controllers/rankingControllers.js";

import { Router } from "express";

const router = Router();

router.get("/ranking", findTop10);

export default router;
