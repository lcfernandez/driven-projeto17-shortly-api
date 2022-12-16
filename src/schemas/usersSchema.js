import Joi from "joi";

export const userSchema = Joi.object(
    {
        name: Joi.string().min(1).trim().required(),
        email: Joi.string().email().required(),
        password: Joi.string().min(4).required(),
        confirmPassword: Joi.valid(Joi.ref("password")).required()
    }
);
