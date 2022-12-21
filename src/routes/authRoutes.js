import { signIn, signUp } from "../controllers/authControllers.js";
import { userSignInSchemaValidation, userSignUpSchemaValidation } from "../middlewares/authValidationMiddleware.js";

import { Router } from "express";

const router = Router();

router.post("/signin", userSignInSchemaValidation, signIn);
router.post("/signup", userSignUpSchemaValidation, signUp);

export default router;
