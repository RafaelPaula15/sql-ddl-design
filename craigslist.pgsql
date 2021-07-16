DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist;

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE users 
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) NOT NULL,
    password VARCHAR(15) NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT,
    text TEXT,
    location TEXT,
    user_id INTEGER REFERENCES users ON DELETE SET NULL,
    region_id INTEGER REFERENCES regions ON DELETE SET NULL,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL
);