const express = require('express');
const connection = require('./db');
const bodyParser = require('body-parser');
const methodOverride = require('method-override');
const {
    isAuthenticated
} = require('./middleware');
const session = require('express-session');
const app = express();

app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());
app.use(methodOverride('_method'));
app.set("view engine", "ejs");
app.set("views", "views");

app.use(session({
    secret: '12345678',
    resave: false,
    saveUninitialized: true,
    cookie: {
        secure: false
    }
}));

// Login Route
app.route('/login')
    .get((req, res) => {
        res.render('login', {
            title: "Login"
        });
    })
    .post((req, res) => {
        const {
            username,
            password
        } = req.body;

        if (username === 'admin' && password === 'admin') {
            req.session.isAuthenticated = true;
            return res.redirect('/barang');
        }

        res.redirect('/login');
    });

// Logout Route
app.get('/logout', (req, res) => {
    req.session.isAuthenticated = false;
    console.log('User logged out');
    res.redirect('/login');
});

// Route untuk Create (POST)
app.post('/barang', (req, res) => {
    const {
        name,
        description
    } = req.body;
    const query = 'INSERT INTO barang (name, description) VALUES (?, ?)';

    connection.query(query, [name, description], (err, results) => {
        if (err) {
            console.error('Error saat memasukkan data: ', err);
            return res.status(500).send(err);
        }

        res.status(201).json({
            id: results.insertId,
            name,
            description
        });
        res.redirect("/barang");
    });
});

// Route untuk Create di Website (POST)
app.post('/tambah', (req, res) => {
    const {
        name,
        description
    } = req.body;
    const query = `INSERT INTO barang (name, description) VALUES ('${req.body.nama}', '${req.body.deskripsi}');`

    connection.query(query, [name, description], (err, results) => {
        if (err) {
            console.error('Error saat memasukkan data: ', err);
            return res.status(500).send(err);
        }

        res.redirect("/barang");
    });
});

// Read (GET semua data)
app.get('/barang', isAuthenticated, (req, res) => {
    connection.query('SELECT * FROM barang', (err, results) => {
        if (err) {
            console.error('Error saat mengambil data: ', err);
            return res.status(500).send(err);
        }

        console.log('Daftar Nama Barang:');
        results.forEach(item => {
            console.log(item.name);
        });

        res.render("index", {
            users: results,
            title: "TUGAS BACKEND"
        });
    });
});

app.get('/barang/search', isAuthenticated, (req, res) => {
    const searchTerm = req.query.searchTerm;

    if (!searchTerm) {
        return res.redirect('/barang');
    }

    const query = 'SELECT * FROM barang WHERE name LIKE ?';

    connection.query(query, [`%${searchTerm}%`], (err, results) => {
        if (err) {
            console.error('Error saat mencari data: ', err);
            return res.status(500).send('Error saat mencari data');
        }

        if (results.length === 0) {
            console.log('Tidak ada hasil yang ditemukan');
            return res.render("index", {
                users: [],
                title: "Hasil Pencarian - Tidak Ditemukan"
            });
        }

        res.render("index", {
            users: results,
            title: "Hasil Pencarian"
        });
    });
});

// Rute dengan parameter :id
app.get('/barang/:id', (req, res) => {
    const {
        id
    } = req.params;

    connection.query('SELECT * FROM barang WHERE id = ?', [id], (err, results) => {
        if (err) {
            console.error('Error saat mengambil data berdasarkan ID: ', err);
            return res.status(500).send(err);
        }

        if (results.length === 0) {
            console.log(`Item dengan ID: ${id} tidak ditemukan`);
            return res.status(404).send('Item not found');
        }

        console.log(`Item ditemukan dengan ID: ${id}, Name: ${results[0].name}`);
        res.json(results[0]);
    });
});

// Update (PUT)
app.put('/barang/:id', (req, res) => {
    const {
        id
    } = req.params;
    const {
        name,
        description
    } = req.body;
    const query = 'UPDATE barang SET name = ?, description = ? WHERE id = ?';

    connection.query(query, [name, description, id], (err, results) => {
        if (err) {
            console.error('Error saat memperbarui data: ', err);
            return res.status(500).send(err);
        }

        if (results.affectedRows === 0) {
            console.log(`Item dengan ID: ${id} tidak ditemukan untuk diperbarui`);
            return res.status(404).send('Item not found');
        }

        console.log(`Updated item with ID: ${id}, New Name: ${name}`);
        res.json({
            message: 'Item updated successfully'
        });
    });
});

// Delete (DELETE)
app.delete('/barang/:id', (req, res) => {
    const {
        id
    } = req.params;

    connection.query('DELETE FROM barang WHERE id = ?', [id], (err, results) => {
        if (err) {
            console.error('Error saat menghapus data: ', err);
            return res.status(500).send(err);
        }

        if (results.affectedRows === 0) {
            console.log(`Item dengan ID: ${id} tidak ditemukan untuk dihapus`);
            return res.status(404).send('Item not found');
        }

        console.log(`Deleted item with ID: ${id}`);
        res.redirect('/barang');
    });
});

// Jalankan server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server berjalan di http://localhost:${PORT}`);
});