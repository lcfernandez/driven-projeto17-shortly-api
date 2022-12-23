import { connectionDB } from "../database/database.js";

import { nanoid } from 'nanoid'

export async function findById(req, res) {
    const id = Number(req.params.id);

    if (isNaN(id)) {
        return res.sendStatus(404);
    }

    try {
        const link = await connectionDB.query(`SELECT id, "shortUrl", url FROM links WHERE id = $1;`, [id]);

        if (link.rowCount === 0) {
            return res.sendStatus(404);
        }

        res.send(link.rows[0]);
    } catch(err) {
        res.status(500).send(err.message);
    }
}

export async function open(req, res) {
    const { linkId } = res.locals;
    const { url } = res.locals;

    try {
        await connectionDB.query(`UPDATE links SET visits = visits + 1 WHERE id = $1;`, [linkId]);

        res.redirect(url);
    } catch(err) {
        res.status(500).send(err.message);
    }
}

export async function remove(req, res) {
    const { id } = req.params;

    try {
        await connectionDB.query(`DELETE FROM links WHERE id = $1;`, [id]);
        
        res.sendStatus(204);
    } catch(err) {
        res.status(500).send(err.message);
    }
}

export async function shorten(req, res) {
    const { userId } = res.locals;
    const { url } = req.body;
    const shortUrl = nanoid(8);

    try {
        await connectionDB.query(`INSERT INTO links ("userId", url, "shortUrl") VALUES ($1, $2, $3);`, [userId, url, shortUrl]);

        res.status(201).send({ shortUrl });
    } catch(err) {
        res.status(500).send(err.message);
    }
}
