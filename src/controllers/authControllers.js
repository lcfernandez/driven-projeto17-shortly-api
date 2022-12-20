import { connectionDB } from "../database/database.js";

import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export async function signIn(req, res) {
    const { email, password } = req.body;
    
    try {
        const user = await connectionDB.query(`SELECT * FROM users WHERE email = $1;`, [email]);

        if (user.rowCount !== 0) {
            const passwordCorrect = bcrypt.compareSync(password, user.rows[0].password);

            if (passwordCorrect) {
                const session = await connectionDB.query(`INSERT INTO sessions ("userId") VALUES ($1) RETURNING id;`, [user.rows[0].id]);
                const token = jwt.sign( { sessionId: session.rows[0].id }, process.env.JWT_SECRET);

                return res.status(200).send(token);
            }
        }

        res.sendStatus(401);
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function signUp(req, res) {
    const { email, name, password } = req.body;
    const passwordHash = bcrypt.hashSync(password, 12);

    try {
        await connectionDB.query(`INSERT INTO users (name, email, password) VALUES ($1, LOWER($2), $3);`, [name, email, passwordHash]);

        res.sendStatus(201);
    } catch (err) {
        res.status(409).send(err.message);
    }
}
