const fs = require("fs");
const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'cyf-youtube-database.cz82uski4grt.us-east-1.rds.amazonaws.com',
  database: 'inital_db',
  password: 'Holloway',
  port: 5432, 
});

pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('Error connecting to the database:', err);
  } else {
    console.log('Database connection established:', res.rows[0].now);
  }
});

module.exports = {
  query: (text, params) => pool.query(text, params),
};
