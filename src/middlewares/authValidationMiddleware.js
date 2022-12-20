import { userSignInSchema, userSignUpSchema } from "../schemas/usersSchema.js";

export function userSignInSchemaValidation(req, res, next) {
    const { error } = userSignInSchema.validate(req.body, { abortEarly: false });

    if (error) {
        return res.status(422).send(
            error.details.map(
                detail => detail.message
            )
        );
    }

    next();
}

export function userSignUpSchemaValidation(req, res, next) {
    const { error } = userSignUpSchema.validate(req.body, { abortEarly: false });

    if (error) {
        return res.status(422).send(
            error.details.map(
                detail => detail.message
            )
        );
    }

    next();
}
