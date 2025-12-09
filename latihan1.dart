import 'dart:io';

void main() {
  // Konstanta harga dan pajak
  const double hargaEspresso = 15000;
  const double hargaLatte = 20000;
  const double hargaTeh = 10000;
  const double pajak = 0.10;

  // Input jumlah pesanan
  stdout.write('Masukkan jumlah Espresso: ');
  int espresso = int.parse(stdin.readLineSync()!);

  stdout.write('Masukkan jumlah Latte: ');
  int latte = int.parse(stdin.readLineSync()!);

  stdout.write('Masukkan jumlah Teh: ');
  int teh = int.parse(stdin.readLineSync()!);

  // Hitung subtotal dan total
  double subtotal = (espresso * hargaEspresso) +
                    (latte * hargaLatte) +
                    (teh * hargaTeh);
  double totalPajak = subtotal * pajak;
  double totalAkhir = subtotal + totalPajak;

  // Waktu transaksi
  final DateTime waktuCetak = DateTime.now();

  // Tampilkan hasil
  print('\n===== Struk Kopi Kita =====');
  print('Espresso  : $espresso x $hargaEspresso');
  print('Latte     : $latte x $hargaLatte');
  print('Teh       : $teh x $hargaTeh');
  print('----------------------------');
  print('Subtotal   : Rp ${subtotal.toStringAsFixed(0)}');
  print('Pajak (10%): Rp ${totalPajak.toStringAsFixed(0)}');
  print('Total Akhir: Rp ${totalAkhir.toStringAsFixed(0)}');
  print('Waktu Cetak: $waktuCetak');
  print('============================');
}
