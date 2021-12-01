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
SELECT id, name, cohort_id
FROM students
LIMIT 5;
`)
// same data & SQL query, but when make query from JS app, results come back as JS objects
.then(res => { // once get executed, dealing with JS objects
  console.log(res.rows); // result is array of JS objects
})
.catch(err => console.error('query error', err.stack));
