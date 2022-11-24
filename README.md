## README Tugas 7
Nama: Dhina Rotua Mutiara
<br />NPM: 2106702182

### Stateless Widget dan Stateful Widget
Stateless widget merupakan widget yang isinya fix (tetap), sedangkan stateful widget merupakan widget yang isinya bersifat dinamis (dapat berubah) selama program berjalan.

Perbedaan stateless widget dengan statefull widget:
* Stateless widget: Tidak memiliki state, tidak berubah selama program berjalan, dan hanya memiliki properti `final`
* Stateful widget: Memiliki state dan dapat berubah selama program berjalan oleh internal state

### Widget yang Digunakan
* FloatingActionButton: Sebagai tombol untuk melakukan increment/decrement pada counter
* Text: Untuk menampilkan text
* Row: Agar child widget dari sebuah widget tersusun ke samping
* Column: Agar child widget dari sebuah widget tersusun ke bawah
* Icon: Memberi icon pada button
* AppBar: Menampilkan appbar aplikasi

### Fungsi `setState()` dan Variable yang Terdampak
`setState()` berfungsi untuk memberi tahu widget bahwa terdapat perubahan state pada objek sehingga widget akan di-_build_ ulang. Pada aplikasi ini, variable yang terdampak adalah `_counter`.

### Perbedaan `const` dengan `final`
Perbedaan antara `const` dengan `final` adalah `const` membuat variable bersifat konstan dan nilainya harus sudah diinisialisasi saat dikompilasi, sedangkan `final` membuat variable tidak harus memiliki nilai saat dikompilasi karena nilainya baru didapatkan saat kompilasi dijalankan.

### Penjelasan Implementasi
1. Membuat flutter project bernama counter_7.
2. Menambahkan function `_decrementCounter` untuk memproses decrement counter.
3. Membuat button baru untuk men-_decrement_ counter yang memanggil function `_decrementCounter`.
4. Menghandle perubahan warna text sesuai dengan nilai counter.
5. Membuat _conditional statement_ agar button decrement hanya muncul saat counter > 0.

-----

## README Tugas 8

### Perbedaan `Navigator.push` dan `Navigator.pushReplacement`
`Navigator.push` akan menyimpan halaman saat ini ketika berpindah ke halaman lain, sedangkan `Navigator.pushReplacement` tidak menyimpan halaman saat ini sehingga kita tidak dapat kembali ke halaman sebelumnya dari halaman saat ini. Dalam konteks _stack_, `Navigator.push` akan menambahkan halaman saat ini ke top of stack (push), sedangkan `Navigator.pushReplacement` akan mengganti halaman pada posisi top of stack dengan halaman saat ini (remove-push).

### Widget yang Digunakan
Pada tugas ini, beberapa widget yang baru saya gunakan adalah:
* Drawer: Untuk menampilkan menu aplikasi yang disembunyikan atau sebaliknya; Untuk dapat mengakses menu lainnya pada aplikasi
* ListTile: Widget yang membentuk sebuah list of widget
* Container: Untuk membungkus suatu widget
* TextFormField: Berfungsi sebagai input field berupa string
* DropdownButton: Button yang berisi beberapa pilihan

### Jenis-Jenis Event pada Flutter
* onChanged: Dipanggil saat user melakukan perubahan pada suatu widget
* onSaved: Dipanggil saat data pada form disimpan
* onPressed: Dipanggil saat user menekan suatu widget (umumnya button)

### Cara Kerja Navigator Mengganti Halaman
Cara kerja navigator dalam mengganti halaman diibaratkan dengan _stack_. Ketika kita membuka suatu halaman, halaman tersebut akan di-push ke stack (posisinya berada di top of stack) dan posisi halaman sebelumnya menjadi di bawah top of stack. Jika kembali ke halaman sebelumnya, maka halaman saat ini akan di-pop dari stack dan halaman sebelumnya menjadi top of stack. Namun, pada _pushReplacement_, halaman saat ini akan digantikan dengan halaman selanjutnya (di-remove dari stack) sehingga tidak dapat kembali ke halaman sebelumnya.

### Penjelasan Implementasi
1. Membuat widget drawer pada navbar untuk mengakses menu Counter, Tambah Budget, dan Data Budget.
2. Membuat file baru bernama `formsBudget.dart` yang merupakan halaman form untuk memproses tambah budget. Setiap budget yang ditambahkan akan disimpan dalam list.
3. Membuat file baru bernama `dataBudget.dart` yang merupakan halaman untuk menampilkan budget-budget yang ditambahkan.
4. Membuat file baru bernama `models.dart` sebagai konfigurasi object budget sehingga data budget dapat tersimpan saat ditambahkan dan dapat diakses oleh halaman Data Budget untuk ditampilkan.

-----

## README Tugas 9

### Pengambilan Data JSON
Kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Namun, hal tersebut tidak lebih baik daripada membuat model sebelum melakukan pengambilan data JSON. Hal ini karena model membuat data yang ada menjadi lebih terstruktur.

### Widget yang Digunakan
Pada tugas ini, beberapa widget yang baru saya gunakan adalah:
* Checkbox: Widget untuk menentukan pilihan (ceklis/tidak)
* BoxDecoration: Untuk mendesign box

### Mekanisme Pengambilan Data dari JSON
1. Menambahkan dependency `http`
2. Membuat model sesuai dengan respons dari data
3. Fetching data
4. Mengkonversikan objek dari web service ke model
5. Menampilkan data dengan FutureBuilder

### Penjelasan Implementasi
1. Membuat model watchlist.
2. Membuat page watchlist dan fetching data dari JSON Watch List Heroku.
3. Menambahkan tombol navigasi ke Watch List pada drawer.
4. Me-_load_ data dari JSON watch list agar bisa ditampilkan di page My Watch List.
5. Membuat navigasi setiap watchlist ke detailnya.
6. Membuat page detail yang merupakan detail film tersebut.
7. Menambahkan tombol back yang akan kembali ke page My Watch List.