import 'dart:io';
import 'dart:math';

class CoffeeShop {
  final Map<String, double> harga = {
    'Espresso': 15000,
    'Latte': 20000,
    'Teh': 10000,
  };
  
  final double pajak = 0.10;
  final double diskonMember = 0.15;
  
  List<Transaksi> riwayat = [];
  Map<String, int> totalPenjualan = {'Espresso': 0, 'Latte': 0, 'Teh': 0};
  
  void tambahTransaksi(String nama, int espresso, int latte, int teh, bool isMember) {
    double subtotal = (espresso * harga['Espresso']!) +
                      (latte * harga['Latte']!) +
                      (teh * harga['Teh']!);
    
    double diskon = isMember ? subtotal * diskonMember : 0;
    double pajakTransaksi = (subtotal - diskon) * pajak;
    double total = (subtotal - diskon) + pajakTransaksi;
    
    riwayat.add(Transaksi(
      nama: nama,
      espresso: espresso,
      latte: latte,
      teh: teh,
      subtotal: subtotal,
      diskon: diskon,
      pajak: pajakTransaksi,
      total: total,
      waktu: DateTime.now(),
      isMember: isMember,
    ));
    
    totalPenjualan['Espresso'] = totalPenjualan['Espresso']! + espresso;
    totalPenjualan['Latte'] = totalPenjualan['Latte']! + latte;
    totalPenjualan['Teh'] = totalPenjualan['Teh']! + teh;
  }
  
  void tampilkanStruk(Transaksi t) {
    print('\n╔════════════════════════════════╗');
    print('║   ☕ KOPI KITA - STRUK BELANJA  ║');
    print('╠════════════════════════════════╣');
    print('║ Pelanggan: ${t.nama.padRight(22)}║');
    print('║ ${(t.isMember ? '⭐ Member' : 'Regular').padRight(32)}║');
    print('╠════════════════════════════════╣');
    print('║ Espresso  : ${t.espresso.toString().padRight(3)} x ${harga['Espresso']!.toStringAsFixed(0).padLeft(7)}      ║');
    print('║ Latte     : ${t.latte.toString().padRight(3)} x ${harga['Latte']!.toStringAsFixed(0).padLeft(7)}      ║');
    print('║ Teh       : ${t.teh.toString().padRight(3)} x ${harga['Teh']!.toStringAsFixed(0).padLeft(7)}      ║');
    print('╠════════════════════════════════╣');
    print('║ Subtotal  : Rp ${t.subtotal.toStringAsFixed(0).padLeft(20)}║');
    if (t.diskon > 0) {
      print('║ Diskon    : -Rp ${t.diskon.toStringAsFixed(0).padLeft(17)}║');
    }
    print('║ Pajak 10% : Rp ${t.pajak.toStringAsFixed(0).padLeft(20)}║');
    print('╠════════════════════════════════╣');
    print('║ TOTAL     : Rp ${t.total.toStringAsFixed(0).padLeft(20)}║');
    print('║ Waktu     : ${t.waktu.toString().substring(0, 19).padRight(22)}║');
    print('╚════════════════════════════════╝\n');
  }
  
  void tampilkanGrafikPenjualan() {
    print('\n📊 GRAFIK PENJUALAN (ASCII Art)');
    print('================================\n');
    
    int maxPenjualan = totalPenjualan.values.reduce(max);
    if (maxPenjualan == 0) maxPenjualan = 1;
    
    totalPenjualan.forEach((kopi, jumlah) {
      int barLength = ((jumlah / maxPenjualan) * 30).toInt();
      String bar = '█' * barLength + '░' * (30 - barLength);
      print('$kopi  │$bar│ $jumlah');
    });
    print('       └' + '─' * 30 + '┘\n');
  }
  
  void tampilkanDashboard() {
    print('\n╔═══════════════════════════════════════╗');
    print('║     📈 DASHBOARD PENJUALAN            ║');
    print('╠═══════════════════════════════════════╣');
    
    double totalRevenue = riwayat.fold(0, (sum, t) => sum + t.total);
    double totalDiskon = riwayat.fold(0, (sum, t) => sum + t.diskon);
    
    print('║ Total Transaksi : ${riwayat.length.toString().padLeft(19)} ║');
    print('║ Total Revenue   : Rp ${totalRevenue.toStringAsFixed(0).padLeft(22)} ║');
    print('║ Total Diskon    : Rp ${totalDiskon.toStringAsFixed(0).padLeft(22)} ║');
    print('║ Rata-rata Order : Rp ${(totalRevenue / max(riwayat.length, 1)).toStringAsFixed(0).padLeft(18)} ║');
    print('╠═══════════════════════════════════════╣');
    print('║ Produk Terlaris : ');
    
    String terlaris = totalPenjualan.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    int terjual = totalPenjualan[terlaris]!;
    print('║   $terlaris ($terjual unit) '.padRight(37) + '║');
    print('╚═══════════════════════════════════════╝\n');
  }
  
  void tampilkanRiwayat() {
    if (riwayat.isEmpty) {
      print('\n⚠️ Belum ada transaksi!\n');
      return;
    }
    
    print('\n📋 RIWAYAT TRANSAKSI\n');
    for (int i = 0; i < riwayat.length; i++) {
      Transaksi t = riwayat[i];
      print('${(i + 1).toString().padRight(2)}. ${t.nama.padRight(15)} | Rp ${t.total.toStringAsFixed(0).padLeft(10)} | ${t.waktu.toString().substring(11, 16)}');
    }
    print('');
  }
}

class Transaksi {
  final String nama;
  final int espresso, latte, teh;
  final double subtotal, diskon, pajak, total;
  final DateTime waktu;
  final bool isMember;
  
  Transaksi({
    required this.nama,
    required this.espresso,
    required this.latte,
    required this.teh,
    required this.subtotal,
    required this.diskon,
    required this.pajak,
    required this.total,
    required this.waktu,
    required this.isMember,
  });
}

void main() {
  CoffeeShop coffeeShop = CoffeeShop();
  
  print('╔════════════════════════════════╗');
  print('║   ☕ SELAMAT DATANG DI KOPI KITA  ║');
  print('║    SISTEM MANAJEMEN PENJUALAN    ║');
  print('╚════════════════════════════════╝\n');
  
  while (true) {
    print('═══════════════════════════════════');
    print('📱 MENU UTAMA:');
    print('1. 🛒 Buat Pesanan Baru');
    print('2. 📊 Lihat Grafik Penjualan');
    print('3. 📈 Lihat Dashboard');
    print('4. 📋 Lihat Riwayat Transaksi');
    print('5. 🚪 Keluar');
    print('═══════════════════════════════════');
    stdout.write('Pilih menu (1-5): ');
    
    String? pilihan = stdin.readLineSync();
    
    switch (pilihan) {
      case '1':
        stdout.write('\nNama Pelanggan: ');
        String nama = stdin.readLineSync() ?? 'Pelanggan';
        
        stdout.write('Adalah member? (y/n): ');
        bool isMember = stdin.readLineSync()?.toLowerCase() == 'y';
        
        stdout.write('Jumlah Espresso: ');
        int espresso = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        
        stdout.write('Jumlah Latte: ');
        int latte = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        
        stdout.write('Jumlah Teh: ');
        int teh = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        
        coffeeShop.tambahTransaksi(nama, espresso, latte, teh, isMember);
        coffeeShop.tampilkanStruk(coffeeShop.riwayat.last);
        break;
        
      case '2':
        coffeeShop.tampilkanGrafikPenjualan();
        break;
        
      case '3':
        coffeeShop.tampilkanDashboard();
        break;
        
      case '4':
        coffeeShop.tampilkanRiwayat();
        break;
        
      case '5':
        print('\n👋 Terima kasih telah berkunjung! Sampai jumpa!\n');
        return;
        
      default:
        print('\n❌ Pilihan tidak valid!\n');
    }
  }
}
