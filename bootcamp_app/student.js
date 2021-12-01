// query w/ node-postgres by connecting to database using Pool
// Pool will manage multiple client connection 
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '5432',
  host: 'localhost',
  database: 'bootcampx'
});

// pool query is function that accepts SQL query as JS string
// function then returns promise that contains result when query is successful
pool.query(`
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE '%${process.argv[2]}%'
LIMIT ${process.argv[3] || 5};
`)
// same data & SQL query, but when make query from JS app, results come back as JS objects
.then(res => { // once get executed, dealing with JS objects
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.stduent_id} and was in the ${user.cohort} cohort`);
  }) // result is array of JS objects
})
.catch(err => console.error('query error', err.stack));
