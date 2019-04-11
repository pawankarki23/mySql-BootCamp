var express = require('express');
var mysql = require('mysql');
var bodyParser  = require("body-parser");
var app = express();
const hostname = '127.0.0.1';
const port = 3000;

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

//app.get('/', (req, res) => res.send('Hello World!'))

var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',  //your username
    database : 'join_us',  //the name of your db
    password : 'Pawans23'
  });
  

app.get("/", function(req, res){
    // Find count of users in DB
    var q = "SELECT COUNT(*) AS count FROM users";
    connection.query(q, function(err, results){
        if(err) throw err;
        var count = results[0].count; 
        //var msg = "We have " + count + " users";
        //res.send(msg);
        res.render("home", {count: count});
    });
});

app.post("/register", function(req, res){
    var person = {
        email: req.body.email
    };
    connection.query('INSERT INTO users SET ?', person, function(err, result) {
        if (err) throw err;
        res.redirect("/");
    });
});


app.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
  });