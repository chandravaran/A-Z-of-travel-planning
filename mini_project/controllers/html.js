var path = require("path");
const bodyParser = require("body-parser");
var mysql = require('mysql');

const db = mysql.createConnection({
  host : 'localhost',
  user : 'root',
  password: '123456',
  database: 'db'
});

db.connect((err) => {
  if (err) return err;
  console.log("My sql connected");
});

module.exports = (app) => {
    app.use(bodyParser.urlencoded({extended: true}));

    var p = path.join(__dirname, "..\\public\\htmlfiles");

    app.get('/', (req, res) => {
        res.sendFile(path.join(p, "\\index.html"));
    });

    app.post('/cabs', (req, res) => {
      let sql = 'SELECT DISTINCT cities_City_Name FROM taxis';
      let query = db.query(sql, (err, results) => {
          if(err) throw err;
          res.render('cabs', {results});
      });
    });

    app.post('/trains', (req, res) => {
      let sql = 'SELECT state_name FROM states';
      let query = db.query(sql, (err, results) => {
          if(err) throw err;
          res.render('trains', {results});
      });
    });

    app.post('/restaurants', (req, res) => {
      let sql = 'SELECT DISTINCT cities_City_Name FROM restaurants';
      let query = db.query(sql, (err, results) => {
          if(err) throw err;
          res.render('restaurants', {results});
      });
    });

    app.post('/tourist', (req, res) => {
      let sql = 'SELECT DISTINCT cities_City_Name FROM tourist_attractions';
      let query = db.query(sql, (err, results) => {
          if(err) throw err;
          res.render('tourist', {results});
      });
    });

    app.post('/cabs_list', (req, res) => {
      let sql = `SELECT * FROM taxis WHERE cities_City_Name = "${req.body.from}"`;
      let query = db.query(sql, (err, results) => {
          if(err) throw err;
          res.render('cabs_list', {results});
      });
    });

    app.post('/trains_list', (req, res) => {
      let sql = `SELECT * FROM trains_has_states WHERE starting_state = "${req.body.from}" AND ending_state = "${req.body.to}"`;
      let query = db.query(sql, (err, results) => {
          if(err) throw err;
          res.render('trains_list', {results});
      });
    });

    app.post('/restaurants_list', (req, res) => {
      let sql = `SELECT * FROM restaurants WHERE cities_City_Name = "${req.body.from}"`;
      let query = db.query(sql, (err, results) => {
          if(err) throw err;
          console.log(results);
          res.render('restaurant_list', {results});
      });
    });

    app.post('/tourist_list', (req, res) => {
      let sql = `SELECT * FROM tourist_attractions WHERE cities_City_Name = "${req.body.from}"`;
      let query = db.query(sql, (err, results) => {
          if(err) throw err;
          console.log(results);
          res.render('tourist_list', {results});
      });
    });
};
