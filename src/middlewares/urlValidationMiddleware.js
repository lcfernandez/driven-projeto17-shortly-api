import { connectionDB } from "../database/database.js";
import { urlSchema } from "../schemas/urlSchema.js";

export async function urlOpenValidation(req, res, next) {
    const { shortUrl } = req.params;

    try {
        const link = await connectionDB.query(`SELECT id, url FROM links WHERE "shortUrl" = $1;`, [shortUrl]);

        if (link.rowCount === 0) {
            return res.sendStatus(404);
        }

        res.locals.linkId = link.rows[0].id;
        res.locals.url = link.rows[0].url;

        next();
    } catch(err) {
        res.status(500).send(err.message);
    }
}

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

export async function urlUserValidation(req, res, next) {
    const { userId } = res.locals;
    const id = Number(req.params.id);

    if (isNaN(id)) {
        return res.sendStatus(404);
    }

    try {
        const link = await connectionDB.query(`SELECT "userId" FROM links WHERE id = $1;`, [id]);

        if (link.rowCount === 0) {
            return res.sendStatus(404);
        }

        if (link.rows[0].userId !== userId) {
            return res.sendStatus(401);
        }

        next();
    } catch(err) {
        res.status(500).send(err.message);
    }
}
