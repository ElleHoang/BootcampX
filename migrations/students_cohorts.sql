CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(250) NOT NULL,
  start_date DATE,
  end_date DATE
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(250) NOT NULL,
  email VARCHAR(250),
  phone VARCHAR(32),
  github VARCHAR(250),
  start_date DATE,
  end_date DATE,
  cohort_id INTEGER REFERENCES cohorts(id) ON DELETE CASCADE
);