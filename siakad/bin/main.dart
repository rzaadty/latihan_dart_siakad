import 'dart:io';
import '../lib/mahasiswa.dart';
import '../lib/matakuliah.dart';
import '../lib/krs.dart';
import '../lib/nilai.dart';

void main() {
  // Simulasi data awal
  var mahasiswa = Mahasiswa('123456', 'Natasya Arum', 3);
  var matkul1 = MataKuliah('MK001', 'Pemrograman Dasar', 3);
  var matkul2 = MataKuliah('MK002', 'Statistika', 2);

  var krs = KRS(mahasiswa);
  var transkrip = Transkrip();

  // Menu interaktif
  while (true) {
    print('\n===== Menu Sistem Akademik =====');
    print('1. Tambah Mata Kuliah ke KRS');
    print('2. Cetak KRS');
    print('3. Input Nilai');
    print('4. Cetak Transkrip');
    print('5. Keluar');
    stdout.write('Pilih opsi: ');
    var pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1': // Tambah mata kuliah ke KRS
        print('\nDaftar Mata Kuliah Tersedia:');
        print('1. ${matkul1.nama} (SKS: ${matkul1.sks})');
        print('2. ${matkul2.nama} (SKS: ${matkul2.sks})');
        stdout.write('Pilih nomor mata kuliah: ');
        var pilihanMatkul = stdin.readLineSync();

        if (pilihanMatkul == '1') {
          krs.tambahMataKuliah(matkul1);
        } else if (pilihanMatkul == '2') {
          krs.tambahMataKuliah(matkul2);
        } else {
          print('Pilihan tidak valid.');
        }
        break;

      case '2': // Cetak KRS
        krs.cetakKRS();
        break;

      case '3': // Input nilai
        print('\nMata Kuliah yang Diambil:');
        for (var i = 0; i < krs.daftarMataKuliah.length; i++) {
          var mk = krs.daftarMataKuliah[i];
          print('${i + 1}. ${mk.nama} (SKS: ${mk.sks})');
        }
        stdout.write('Pilih nomor mata kuliah: ');
        var pilihanMatkul = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        if (pilihanMatkul > 0 &&
            pilihanMatkul <= krs.daftarMataKuliah.length) {
          var mataKuliahDipilih =
              krs.daftarMataKuliah[pilihanMatkul - 1];
          stdout.write('Masukkan nilai: ');
          var nilai = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

          transkrip.tambahNilai(Nilai(mataKuliahDipilih, nilai));
        } else {
          print('Pilihan tidak valid.');
        }
        break;

      case '4': // Cetak transkrip
        transkrip.cetakTranskrip();
        break;

      case '5': // Keluar
        print('Terima kasih!');
        return;

      default:
        print('Pilihan tidak valid.');
    }
  }
}
