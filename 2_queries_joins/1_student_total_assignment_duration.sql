SELECT SUM(assignment_submissions.duration) as total_duration
FROM assignment_submissions
/*FROM students */ -- getting data from the assignment_submissions table NOT STUDENTS table
JOIN students
/*INNER JOIN assignment_submissions */ -- joining the students table to assignment_submissions table 
ON students.id = assignment_submissions.student_id
WHERE students.name = 'Ibrahim Schimmel'; 