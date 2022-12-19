CREATE DATABASE shortly;

SET timezone = 'America/Sao_Paulo';

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE sessions (
    id SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES users(id),
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE links (
    id SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES users(id),
    url TEXT NOT NULL,
    "shortUrl" VARCHAR(8) NOT NULL UNIQUE,
    visits INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
