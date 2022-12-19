import { userSchema } from "../schemas/usersSchema.js";

export function userSchemaValidation(req, res, next) {
    const { error } = userSchema.validate(req.body, { abortEarly: false });

    if (error) {
        return res.status(422).send(
            error.details.map(
                detail => detail.message
            )
        );
    }

    next();
}
