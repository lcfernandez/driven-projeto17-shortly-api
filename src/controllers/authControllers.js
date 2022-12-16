// TODO: remove after db creation
import { users } from "../server.js";
import bcrypt from "bcrypt";

export function signUp(req, res) {
    const user = req.body;
    const passwordHash = bcrypt.hashSync(user.password, 12);

    // TODO: remove after db creation
    delete user.confirmPassword;
    users.push({ ...user, password: passwordHash });

    // TODO: insert into db
    
    res.sendStatus(201);
}
