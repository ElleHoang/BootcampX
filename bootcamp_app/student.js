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
// each $ in query is placeholder that rep where value should go but cam't because its ccoming from somewhere else (miught be malicious)
const queryString = `
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1 
LIMIT $2;
`;
// $1 & $2 placeholder will get replaced with actual data from values array
// numing starts at 1 instead of 0, so 1st value in query $1 corresponds to 1st value in array values[0]

const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
// stored all potentially malicious values in an array
const values = [`%${cohortName}%`, limit];

/* PROTECTS FROM SQL injection */
pool.query(queryString, values); // PoqstgeSQL receives two pieces of info separately. It knows 1st part is safe query that it can run & that 2nd part is data that may be malicious
// PostgrSQL will use values as data w/in query but not run values as part of query

// same data & SQL query, but when make query from JS app, results come back as JS objects
.then(res => { // once get executed, dealing with JS objects
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.stduent_id} and was in the ${user.cohort} cohort`);
  }) // result is array of JS objects
})
.catch(err => console.error('query error', err.stack));
