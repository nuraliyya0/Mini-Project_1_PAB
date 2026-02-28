# Feragown
# Deskripsi
Feragown adalah aplikasi mobile berbasis Flutter yang digunakan untuk mengelola proses penyewaan gaun. Aplikasi ini memungkinkan untuk pengguna melihat daftar gaun, melakukan input data penyewaan, dan menentukan tanggal sewa dan tanggal pengembalian, serta melihat data penyewaan yang sudah tersimpan. Aplikasi dibuat menggunakan Multi Page Navigation untuk memisahkan halaman agar lebih terstruktur dan mudah digunakan.

## Fitur Aplikasi
- Halaman Home sebagai pembukaan aplikasi Feragown
- Menampilkan daftar gaun yang tersedia untuk disewa
- Form input data penyewaan:
  - Nama penyewa
  - Tanggal sewa
  - Tanggal pengembalian
  - Harga sewa
- Menyimpan dan menampilkan data penyewaan
- Edit (update) data penyewaan
- Navigasi antar halaman (Home, Form Penyewaan, Data Penyewaan)

## Widget yang Digunakan
MaterialApp
-Scaffold
- AppBar
- Column
- Row
- ListView
- Card
- Text
- TextField
- ElevatedButton
- IconButton
- Navigator
- TextEditingController

# Wadget yang digunakan
StatefulWidget 
| Widget                                   | Digunakan Pada             | Fungsi                                 |
| ---------------------------------------- | -------------------------- | -------------------------------------- |
| MyApp                                    | Konfigurasi utama aplikasi | Mengatur MaterialApp dan tema aplikasi |
| HomePage (jika tidak ada perubahan data) | Halaman pembuka            | Menampilkan menu utama Feragown        |


| Widget         | Digunakan Pada | Fungsi                                                  |
| -------------- | -------------- | ------------------------------------------------------- |
| RentalFormPage | Form Penyewaan | Menyimpan dan mengelola input nama, tanggal sewa, harga |
| RentalListPage | Data Penyewaan | Menampilkan dan memperbarui daftar penyewaan            |
| EditRentalPage | Edit Data      | Mengubah data penyewaan                                 |

Layout
- Scaffold
Struktur dasar setiap halaman

- AppBar 
Menampilkan judul halaman

- Column & Row 
Mengatur susunan widget vertikal dan horizontal

- Padding & Container
Mengatur jarak dan tampilan desain

- Card 
Menampilkan data penyewaan agar lebih rapi

- ListView.builder
Menampilkan daftar data secara dinamis dan bisa discroll

<img width="1539" height="884" alt="image" src="https://github.com/user-attachments/assets/a690d6c8-2592-4c3a-b6de-275e363afe74" />
<img width="1524" height="896" alt="image" src="https://github.com/user-attachments/assets/a127843d-1c8e-4ccc-bae4-0a6b4e619bf6" />
<img width="1530" height="877" alt="image" src="https://github.com/user-attachments/assets/b6178274-d8fc-4082-b5a3-a4a7364f85f6" />
<img width="1534" height="889" alt="image" src="https://github.com/user-attachments/assets/2f77fc32-4350-4a0a-bb4f-4b58e025043c" />
<img width="1525" height="905" alt="image" src="https://github.com/user-attachments/assets/7f61f95c-f5c7-4524-901a-d9cb8d7c043f" />
<img width="1526" height="887" alt="image" src="https://github.com/user-attachments/assets/cb0c6710-e43f-43e5-9c4b-3da7a6f4cda0" />
balik ke homepage

