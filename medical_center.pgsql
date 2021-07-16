DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center;

CREATE TABLE doctors 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  specialty TEXT NOT NULL
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  insurance text,
  birth_date DATE NOT NULL
);

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
  date DATE NOT NULL
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  name TEXT,
  description VARCHAR(30)
);

CREATE TABLE diagnoses
(
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES visits ON DELETE CASCADE,
  disease_id INTEGER REFERENCES diseases ON DELETE CASCADE,
  notes TEXT
);