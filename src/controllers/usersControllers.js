import { connectionDB } from "../database/database.js";

export async function findAll(req, res) {
    const { userId } = res.locals;

    try {
        const response = await connectionDB.query(
            `SELECT
                u.id,
                u.name,
                SUM(l.visits) AS "visitCount",
                json_agg(json_build_object('id', l.id, 'shortUrl', l."shortUrl", 'url', l.url, 'visitCount', l.visits)) AS "shortenedUrls"
            FROM links l
            JOIN users u ON l."userId" = u.id
            WHERE l."userId" = $1
            GROUP BY u.id;
            `,
            [userId]
        );

        res.status(200).send(response.rows[0]);
    } catch(err) {
        res.status(500).send(err.message);
    }
}
