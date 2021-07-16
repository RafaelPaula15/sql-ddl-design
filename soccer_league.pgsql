DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birth_date DATE NOT NULL,
    height TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    away_team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    location TEXT NOT NULL,
    date DATE NOT NULL,
    start_time TEXT NOT NULL,
    season_id INTEGER REFERENCES season ON DELETE SET NULL,
    head_referee_id INTEGER REFERENCES referees ON DELETE SET NULL,
    assistent_referee_1_id INTEGER REFERENCES referees ON DELETE SET NULL,
    assistent_referee_2_id INTEGER REFERENCES referees ON DELETE SET NULL
);

CREATE TABLE lineups
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE SET NULL,
    match_id INTEGER REFERENCES matches ON DELETE SET NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE goals
(
id SERIAL PRIMARY KEY,
player_id INTEGER REFERENCES players ON DELETE SET NULL,
match_id INTEGER REFERENCES matches ON DELETE SET NULL
);

CREATE TABLE results 
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    match_id INTEGER REFERENCES matches ON DELETE SET NULL,
    result TEXT
);

