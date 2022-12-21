import { urlSchema } from "../schemas/urlSchema.js";

export function urlSchemaValidation(req, res, next) {
    const { error } = urlSchema.validate(req.body, { abortEarly: false });

    if (error) {
        return res.status(422).send(
            error.details.map(
                detail => detail.message
            )
        );
    }

    next();
}
