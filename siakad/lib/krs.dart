import 'mahasiswa.dart';
import 'matakuliah.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah = [];

  KRS(this.mahasiswa);

  void tambahMataKuliah(MataKuliah mataKuliah) {
    daftarMataKuliah.add(mataKuliah);
    print('Mata kuliah "${mataKuliah.nama}" berhasil ditambahkan.');
  }

  void cetakKRS() {
    print('\n===== KRS Mahasiswa =====');
    print('Nama: ${mahasiswa.nama}');
    print('NIM: ${mahasiswa.nim}');
    print('Semester: ${mahasiswa.semester}');
    print('Daftar Mata Kuliah:');
    for (var mk in daftarMataKuliah) {
      print('- ${mk.nama} (SKS: ${mk.sks})');
    }
    print('=========================\n');
  }
}
