import 'matakuliah.dart';

class Nilai {
  MataKuliah mataKuliah;
  double nilai;

  Nilai(this.mataKuliah, this.nilai);

  String getHurufNilai() {
    if (nilai >= 85) return 'A';
    if (nilai >= 75) return 'B';
    if (nilai >= 60) return 'C';
    if (nilai >= 50) return 'D';
    return 'E';
  }

  String getKategori() {
    if (nilai >= 90) return 'Sangat Baik';
    if (nilai >= 80) return 'Baik';
    if (nilai >= 70) return 'Sedang';
    if (nilai >= 60) return 'Buruk';
    return 'Sangat Buruk';
  }

  int getBobot() {
    if (nilai >= 85) return 4;
    if (nilai >= 75) return 3;
    if (nilai >= 60) return 2;
    if (nilai >= 50) return 1;
    return 0;
  }
}

class Transkrip {
  List<Nilai> daftarNilai = [];

  void tambahNilai(Nilai nilai) {
    daftarNilai.add(nilai);
    print('Nilai untuk mata kuliah "${nilai.mataKuliah.nama}" berhasil ditambahkan.');
  }

  double hitungIPK() {
    if (daftarNilai.isEmpty) return 0.0;
    var totalBobot = 0.0;
    var totalSKS = 0;

    for (var nilai in daftarNilai) {
      totalBobot += nilai.getBobot() * nilai.mataKuliah.sks;
      totalSKS += nilai.mataKuliah.sks;
    }

    return totalBobot / totalSKS;
  }

  void cetakTranskrip() {
    print('\n===== Transkrip Nilai =====');
    for (var nilai in daftarNilai) {
      print(
          '- ${nilai.mataKuliah.nama} (SKS: ${nilai.mataKuliah.sks}): ${nilai.nilai.toStringAsFixed(2)} (${nilai.getHurufNilai()}, ${nilai.getKategori()})');
    }
    print('\nIPK: ${hitungIPK().toStringAsFixed(2)}');
    print('==========================\n');
  }
}
