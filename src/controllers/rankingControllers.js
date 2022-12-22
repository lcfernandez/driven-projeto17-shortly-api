import { connectionDB } from "../database/database.js";

export async function findTop10(req, res) {
    try {
        const response = await connectionDB.query(
            `SELECT
                u.id,
                u.name,
                COUNT(l.*) AS "linksCount",
                COALESCE(SUM(l.visits),0) AS "visitCount"
            FROM users u
            LEFT JOIN links l ON l."userId" = u.id
            GROUP BY u.id
            ORDER BY "visitCount" DESC
            LIMIT 10;`
        );

        res.send(response.rows);
    } catch(err) {
        res.status(500).send(err.message);
    }
}
