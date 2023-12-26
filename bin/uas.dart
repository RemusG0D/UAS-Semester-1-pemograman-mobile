// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

class Buku {
  int id;
  String judul;
  String pengarang;
  String genre;
  int harga;
  String keterangan;

  Buku(
    this.id,
    this.judul,
    this.pengarang,
    this.genre,
    this.harga,
    this.keterangan,
  );

  @override
  String toString() {
    return '''

ID        : $id 
Judul     : $judul 
Pengarang : $pengarang
Genre     : $genre
Harga     : RP $harga,000
Keterangan: $keterangan

''';
  }
}

class TokoBuku {
  List<Buku> daftarBuku = [];
  int idBerikutnya = 1;

  void tambahBuku(String judul, String pengarang, String genre, int harga,
      String keterangan) {
    daftarBuku
        .add(Buku(idBerikutnya++, judul, pengarang, genre, harga, keterangan));
    print('Buku berhasil ditambahkan.');
  }

  void tampilkanBuku() {
    if (daftarBuku.isEmpty) {
      print('Tidak ada buku yang tersedia.');
    } else {
      daftarBuku.forEach((buku) {
        print(buku);
      });
    }
  }

  Buku cariBukuById(int id) {
    return daftarBuku.firstWhere((buku) => buku.id == id);
  }

  void updateBuku(int id, String judul, String pengarang, String genre,
      int harga, String keterangan) {
    Buku bukuAda = cariBukuById(id);

    if (bukuAda != null) {
      bukuAda.judul = judul;
      bukuAda.pengarang = pengarang;
      bukuAda.harga = harga;
      bukuAda.keterangan = keterangan;
      print('Buku berhasil diperbarui.');
    } else {
      print('Buku tidak ditemukan.');
    }
  }

  void hapusBuku(int id) {
    Buku bukuAda = cariBukuById(id);

    if (bukuAda != null) {
      daftarBuku.remove(bukuAda);
      print('Buku berhasil dihapus.');
    } else {
      print('Buku tidak ditemukan.');
    }
  }
}

void main() {
  TokoBuku tokoBuku = TokoBuku();

  while (true) {
    print('');
    print('''
            RIANMEDIA
Tanggal :${DateTime.now()}
====== Manajemen Toko Buku ==========         
1. Tambahkan buku           
2. Tampilkan Buku           
3. Perbarui Buku            
4. Hapus Buku               
5. Cari Buku                
6. Keluar                   
=====================================
''');
    stdout.write('Pilih opsi :');
    String input = stdin.readLineSync().toString().trim();

    switch (input) {
      case '1':
        stdout.write('Masukkan judul: ');
        String judul = stdin.readLineSync().toString();
        stdout.write('Masukkan pengarang: ');
        String pengarang = stdin.readLineSync().toString();
        stdout.write('Masukkan harga: ');
        String genre = stdin.readLineSync().toString();
        stdout.write('Masukkan genre: ');
        int harga = int.parse(stdin.readLineSync().toString());
        stdout.write('Masukkan keterangan: ');
        String keterangan = stdin.readLineSync().toString();
        tokoBuku.tambahBuku(judul, pengarang, genre, harga, keterangan);
        break;
      case '2':
        tokoBuku.tampilkanBuku();
        break;
      case '3':
        stdout.write('Masukkan ID buku yang akan diperbarui: ');
        int id = int.parse(stdin.readLineSync().toString());
        stdout.write('Masukkan judul baru: ');
        String judulBaru = stdin.readLineSync().toString();
        stdout.write('Masukkan pengarang baru: ');
        String pengarangBaru = stdin.readLineSync().toString();
        stdout.write('Masukkan harga baru: ');
        String genreBaru = stdin.readLineSync().toString();
        stdout.write('Masukkan genre baru: ');
        int hargaBaru = int.parse(stdin.readLineSync().toString());
        stdout.write('Masukkan keterangan baru: ');
        String keteranganBaru = stdin.readLineSync().toString();
        tokoBuku.updateBuku(
            id, judulBaru, pengarangBaru, genreBaru, hargaBaru, keteranganBaru);
        break;
      case '4':
        stdout.write('Masukkan ID buku yang akan dihapus: ');
        int id = int.parse(stdin.readLineSync().toString());
        tokoBuku.hapusBuku(id);
        break;
      case '5':
        stdout.write('Cari Buku berdasarkan Id: ');
        int id = int.parse(stdin.readLineSync()!);
        Buku daftarbuku = tokoBuku.cariBukuById(id);
        if (daftarbuku == null) {
          print('Tidak Ditemukan');
        } else {
          print(
              // ignore: prefer_if_null_operators
              'Buku dengan ID $id: ${daftarbuku != null ? daftarbuku : "Tidak ditemukan"}');
        }

      case '6':
        print('Keluar dari program.');
        exit(0);
      default:
        print('Opsi tidak valid. Silakan pilih angka dari 1 hingga 6.');
    }
  }
}
