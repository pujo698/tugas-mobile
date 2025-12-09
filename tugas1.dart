import 'dart:io';

void main() {
  print('=================================');
  print('Nama: Wahid Sandy Pujo Dzulhijayanto');
  print('NIM : 32602300015');
  print('=================================\n');

  print('=== Tiket Taman Hiburan SeruLand ===\n');

  // Input data
  stdout.write('Masukkan usia pengunjung: ');
  int usia = int.parse(stdin.readLineSync()!);

  stdout.write('Apakah akhir pekan? (true/false): ');
  bool isAkhirPekan = stdin.readLineSync()!.toLowerCase() == 'true';

  stdout.write('Apakah memiliki MemberCard? (true/false): ');
  bool punyaMember = stdin.readLineSync()!.toLowerCase() == 'true';

  double harga;
  String kategori;

  // Menentukan kategori & harga dasar
  if (usia < 6) {
    kategori = 'Gratis';
    harga = 0;
  } else if (usia <= 17) {
    kategori = 'Pelajar';
    harga = 40000;
  } else if (usia <= 60) {
    kategori = 'Dewasa';
    harga = 60000;
  } else {
    kategori = 'Lansia';
    harga = 30000;
  }

  double hargaAwal = harga;

  // Aturan lanjutan
  if (harga > 0) {
    if (isAkhirPekan) {
      harga *= 1.20; // naik 20%
    }

    if (punyaMember) {
      harga *= 0.90; // diskon 10%
    }

    if (harga < 30000) {
      harga = 30000;
    }
  }

  // Output hasil
  print('\n=== Ringkasan Tiket SeruLand ===');
  print('Kategori          : $kategori');
  print('Harga awal        : Rp${hargaAwal.toStringAsFixed(0)}');
  print('Akhir pekan       : ${isAkhirPekan ? "Ya (+20%)" : "Tidak"}');
  print('MemberCard        : ${punyaMember ? "Ya (-10%)" : "Tidak"}');
  print('Total dibayar     : Rp${harga.toStringAsFixed(0)}');
  print('=================================');
}
