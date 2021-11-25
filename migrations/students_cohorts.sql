-- TABLE: cohorts
-- id: unique identifier
-- name: name of cohort
-- start_date: cohort's start date
-- end_date: cohort's end date

CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(250) NOT NULL,
  start_date DATE,
  end_date DATE
);

-- TABLE: students
-- id: unique identifier
-- name: full name of student
-- email: student's email address
-- phone: student's phome number
-- github: student's github profile url
-- start_date: student's start date of bootcamp
-- end_date: student's end date of bootcamp
-- cohort_is: id of cohort that student is enrolled in

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