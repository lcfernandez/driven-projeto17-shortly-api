import { connectionDB } from "../database/database.js";

import bcrypt from "bcrypt";

export async function signUp(req, res) {
    const user = req.body;
    const passwordHash = bcrypt.hashSync(user.password, 12);

    try {
        await connectionDB.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`, [user.name, user.email, passwordHash]);

        res.sendStatus(201);
    } catch (err) {
        res.status(409).send(err.message);
    }
}
