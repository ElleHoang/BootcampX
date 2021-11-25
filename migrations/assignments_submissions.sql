-- TABLE: assignments
-- id: unique identifer
-- name: name of assignment
-- content: written content body of assignment
-- day: day assignment appears on
-- chapter: order the assignment will appear that day
-- duration: avg time it takes student to finish

CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(250) NOT NULL,
  content TEXT,
  day INTEGER,
  chapter INTEGER,
  duration INTEGER
);

-- TABLE: assignment_submissions
-- id: unique identifier
-- assignment_is: id of assignment
-- student_id: id of student
-- duration: time it took student to complete assignment
-- submission_date: date it was submitted

CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
);