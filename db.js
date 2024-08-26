const mysql = require('mysql');

// Buat koneksi MySQL

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',      
  password: '',      
  database: 'tugasbackend'  
});

// Cek koneksi
connection.connect((err) => {
  if (err) {
    console.error('Koneksi ke MySQL gagal: ' + err.stack);
    return;
  }
  
  console.log('Terkoneksi dengan MySQL sebagai id ' + connection.threadId);
});

module.exports = connection;
