import { connectionDB } from "../database/database.js";

export async function findTop10(req, res) {
    try {
        const response = await connectionDB.query(
            `SELECT
                u.id,
                u.name,
                COUNT(l.*) AS "linksCount",
                SUM(l.visits) AS "visitCount"
            FROM users u
            JOIN links l ON l."userId" = u.id
            GROUP BY u.id
            ORDER BY "visitCount" DESC
            LIMIT 10;`
        );

        res.send(response.rows.map(link => link));
    } catch(err) {
        res.status(500).send(err.message);
    }
}
