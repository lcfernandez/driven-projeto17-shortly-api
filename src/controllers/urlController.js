import { connectionDB } from "../database/database.js";

import { nanoid } from 'nanoid'

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