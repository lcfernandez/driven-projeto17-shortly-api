import { connectionDB } from "../database/database.js";
import { userSignInSchema, userSignUpSchema } from "../schemas/usersSchema.js";

import jwt from "jsonwebtoken";

export async function authSessionValidation(req, res, next) {
    try {
        const token = req.headers.authorization?.replace("Bearer ", "");

        if (!token) {
            return res.sendStatus(401);
        }

        const jwtVerify = jwt.verify(token, process.env.JWT_SECRET, (err, result) => { return { err, result } });

        if (jwtVerify.err) {
            return res.sendStatus(401);
        }

        const { sessionId } = jwtVerify.result;

        const sessionExists = await connectionDB.query(`SELECT "userId" FROM sessions WHERE id = $1;`, [sessionId]);

        if (sessionExists.rowCount === 0) {
            return res.sendStatus(404);
        }

        res.locals.userId = sessionExists.rows[0].userId;

        next();
    } catch(err) {
        res.status(500).send(err.message);
    }
}

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
