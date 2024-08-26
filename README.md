1. Nyalakan Apache dan MySQL pada XAMPP,
2. Jalankan program dengan command "npm run api-service" pada terminal,
3. Masukkan "http://localhost:3000/login" pada browser,
4. Login dengan username dan password : "admin",
5. Modifikasi dengan menambah atau menghapus data.

==================================================================================================

Menggunakan postman:
1. Login Menggunakan Postman
    Metode: POST
    URL: https://api.kevinio.my.id/login
    Body: Gunakan format x-www-form-urlencoded dengan parameter:
      {
        "username": "admin",
        "password": "admin"
      }

2. Gunakan Sesi untuk Mengakses API yang Dilindungi
   Setelah login berhasil dan cookie tersimpan di Postman, Anda dapat mengakses endpoint lain di API Anda yang memerlukan autentikasi.

   Metode: GET/POST/PUT/DELETE (sesuai dengan API yang ingin diakses)
   URL: Misalnya, https://api.kevinio.my.id/barang/1
   Headers: Cookie dari sesi login akan otomatis dikirim oleh Postman jika Anda berada dalam sesi yang sama.

