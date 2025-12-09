import 'dart:io';

void main() {
  stdout.write('Masukkan nilai rata-rata: ');
  int nilai = int.parse(stdin.readLineSync()!);

  stdout.write('Masukkan pendapatan orang tua (Rp): ');
  int pendapatan = int.parse(stdin.readLineSync()!);

  stdout.write('Apakah memiliki prestasi? (true/false): ');
  bool punyaPrestasi = stdin.readLineSync()!.toLowerCase() == 'true';

  String tingkat = '';
  if (punyaPrestasi) {
    stdout.write('Masukkan tingkat prestasi (kota/provinsi/nasional): ');
    tingkat = stdin.readLineSync()!.toLowerCase();
  }

  String status;
  String alasan;

  if (nilai >= 85) {
    if (tingkat == 'provinsi' || tingkat == 'nasional') {
      status = 'Diterima Penuh';
      alasan = 'Nilai tinggi dan prestasi minimal provinsi';
    } else if (pendapatan < 5000000 || tingkat == 'kota') {
      status = 'Diterima Parsial';
      alasan = 'Nilai tinggi dan memenuhi salah satu syarat tambahan';
    } else {
      status = 'Tidak Diterima';
      alasan = 'Nilai cukup tapi pendapatan tinggi dan tanpa prestasi';
    }
  } else {
    status = 'Tidak Diterima';
    alasan = 'Nilai rata-rata di bawah 85';
  }

  print('\nStatus Beasiswa: $status');
  print('Alasan: $alasan');
}
