SELECT cohorts.name as cohort, /* COUNT(assignment_submissions.assignment_id) */ COUNT(assignment_submissions.*) as total_submissions
/* FROM cohorts */ FROM assignment_submissions
JOIN students ON /* cohorts.id = cohort_id */ students.id = student_id
/* JOIN assignment_submissions ON students.id = student_id */
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohort
ORDER BY total_submissions DESC;