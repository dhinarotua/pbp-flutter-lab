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