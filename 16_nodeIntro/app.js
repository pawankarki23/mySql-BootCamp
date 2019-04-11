
// install faker to fake data

// npm install faker;

var faker = require('faker')
//console.log(faker.internet.email());
var mysql = require('mysql')
 
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',  //your username
  database : 'join_us',  //the name of your db
  password : 'Pawans23'
});

/* var q = 'SELECT CURTIME() as time, CURDATE() as date, NOW() as now';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results[0].time);
  console.log(results[0].date);
  console.log(results[0].now);
});*/

//To count the number of users in the database:
var q = 'SELECT COUNT(*) AS total FROM users ';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results[0].total);
});

// insert 500 users -- for the very first time
/*
var data = [];
for(var i = 0; i < 500; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ]);
}
 
var q = 'INSERT INTO users (email, created_at) VALUES ?';
 
connection.query(q, [data], function(err, result) {
  console.log(err);
  console.log(result);
});
*/

connection.end();