import 'dart:io';

void main() {
  print('=== Aplikasi KurirKita ===');
  print('Kode layanan:');
  print('S = Same Day');
  print('E = Express (1–2 hari)');
  print('R = Reguler (2–4 hari)');
  print('H = Hemat (3–7 hari)');
  stdout.write('Masukkan kode layanan: ');
  String kode = stdin.readLineSync()!.toUpperCase();

  String deskripsi;
  int biayaTambahan;

  switch (kode) {
    case 'S':
      deskripsi = 'Same Day (1 hari)';
      biayaTambahan = 25000;
      break;
    case 'E':
      deskripsi = 'Express (1–2 hari)';
      biayaTambahan = 15000;
      break;
    case 'R':
      deskripsi = 'Reguler (2–4 hari)';
      biayaTambahan = 8000;
      break;
    case 'H':
      deskripsi = 'Hemat (3–7 hari)';
      biayaTambahan = 0;
      break;
    default:
      deskripsi = 'Kode tidak dikenal';
      biayaTambahan = 0;
  }

  print('\n=== Ringkasan Pengiriman ===');
  print('Layanan: $deskripsi');
  print('Biaya tambahan: Rp$biayaTambahan');
  print('============================');
}
