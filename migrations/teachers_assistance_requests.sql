-- TABLE: teachers
-- id: unique identifier
-- name: name of teacher
-- start_date: date teacher started working
-- end_date: date that teacher stopped working
-- is_active: if teacher is actively teaching now

CREATE TABLE teachers (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(250) NOT NULL,
  start_date DATE,
  end_date DATE,
  is_active BOOLEAN DEFAULT TRUE
);

-- TABLE: assistance_requests
-- id: unique identifier
-- assignment_id: id of assignment the request was made from
-- student_id: id of student making request
-- teacher_id: id of teacher responding to request
-- created_at: timestamp when request was made
-- started_at: timestamp when assistance started
-- completed_at: timestamp when assistance was completed
-- student_feedback: Feedback about student given by teacher
-- teacher_feedback: Feedback about teacher given by student
CREATE TABLE assistance_requests (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  created_at TIMESTAMP,
  started_at TIMESTAMP,
  completed_at TIMESTAMP,
  student_feedback TEXT,
  teacher_feedback TEXT
);
