import 'dart:io';

void main() {
  // Inisialisasi data penjualan (jumlah buku terjual per transaksi)
  List<int> penjualan = [5, 8, 12, 3, 10, 7, 9, 4];

  // Hitung total dan rata-rata penjualan dengan for loop
  int total = 0;
  for (int i = 0; i < penjualan.length; i++) {
    total += penjualan[i];
  }
  double rataRata = total / penjualan.length;

  // Cari nilai maksimum dan minimum dengan while
  int i = 1;
  int maksimum = penjualan[0];
  int minimum = penjualan[0];
  while (i < penjualan.length) {
    if (penjualan[i] > maksimum) maksimum = penjualan[i];
    if (penjualan[i] < minimum) minimum = penjualan[i];
    i++;
  }

  // Tambah transaksi baru dengan do-while
  String lanjut;
  do {
    stdout.write('Masukkan jumlah buku terjual (>=0): ');
    int jumlahBaru = int.parse(stdin.readLineSync()!);
    penjualan.add(jumlahBaru);

    stdout.write('Tambah transaksi lagi? (y/n): ');
    lanjut = stdin.readLineSync()!.toLowerCase();
  } while (lanjut == 'y');

  // Hitung ulang total dan rata-rata
  total = 0;
  for (int j = 0; j < penjualan.length; j++) {
    total += penjualan[j];
  }
  rataRata = total / penjualan.length;

  // Tampilkan ringkasan
  print('\n=== Ringkasan Penjualan BukuBahagia ===');
  print('Jumlah transaksi : ${penjualan.length}');
  print('Total buku terjual: $total');
  print('Rata-rata per transaksi: ${rataRata.toStringAsFixed(2)}');
  print('Nilai maksimum: $maksimum');
  print('Nilai minimum: $minimum');

  // Menampilkan 3 transaksi terakhir
  int mulai = penjualan.length > 3 ? penjualan.length - 3 : 0;
  print('3 transaksi terakhir: ${penjualan.sublist(mulai)}');
  print('=======================================');
}
