import { connectionDB } from "../database/database.js";

export async function findById(req, res) {
    const { userId } = res.locals;

    try {
        const response = await connectionDB.query(
            `SELECT
                u.id,
                u.name,
                COALESCE(SUM(l.visits), 0) AS "visitCount",
                COALESCE(
                    json_agg(
                        json_build_object('id', l.id, 'shortUrl', l."shortUrl", 'url', l.url, 'visitCount', l.visits)
                    ) FILTER (WHERE l.* IS NOT NULL),
                    '[]'
                ) AS "shortenedUrls"
            FROM users u
            LEFT JOIN links l ON l."userId" = u.id
            WHERE u.id = $1
            GROUP BY u.id;
            `,
            [userId]
        );

        if (response.rowCount === 0) {
            return res.sendStatus(404);
        }

        res.send(response.rows[0]);
    } catch(err) {
        res.status(500).send(err.message);
    }
}
