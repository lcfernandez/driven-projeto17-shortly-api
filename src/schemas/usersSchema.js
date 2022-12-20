import Joi from "joi";

export const userSignInSchema = Joi.object(
    {
        email: Joi.string().email().required(),
        password: Joi.string().required()
    }
);

export const userSignUpSchema = Joi.object(
    {
        name: Joi.string().min(1).max(50).trim().required(),
        email: Joi.string().email().required(),
        password: Joi.string().min(4).required(),
        confirmPassword: Joi.valid(Joi.ref("password")).required()
    }
);
