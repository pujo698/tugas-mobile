void main() {
  print('=================================');
  print('Nama: Wahid Sandy Pujo Dzulhijayanto');
  print('NIM : 32602300015');
  print('=================================\n');
  print('=== Sistem Kasir Minimarket Hemart ===\n');

  // Katalog barang
  Map<String, Map<String, dynamic>> katalog = {
    "M01": {"nama": "Air Mineral 1L", "kategori": "minuman", "stok": 20, "harga": 8000},
    "M02": {"nama": "Jus Jeruk", "kategori": "minuman", "stok": 10, "harga": 12000},
    "S01": {"nama": "Keripik Kentang", "kategori": "snack", "stok": 15, "harga": 15000},
    "S02": {"nama": "Cokelat Batang", "kategori": "snack", "stok": 8, "harga": 18000},
    "H01": {"nama": "Sabun Mandi", "kategori": "higienis", "stok": 12, "harga": 10000},
  };

  // Keranjang belanja
  Map<String, int> keranjang = {
    "M01": 6,   // promo minuman
    "S01": 4,
    "S02": 5,
    "X01": 2,   // tidak ada di katalog
  };

  bool member = true;

  double totalSnack = 0;
  double totalBelanja = 0;
  double diskonSnack = 0;
  double diskonMember = 0;

  print('Daftar Pembelian:\n');

  keranjang.forEach((kode, qty) {
    if (!katalog.containsKey(kode)) {
      print('$kode - Barang tidak ditemukan!');
      return;
    }

    var barang = katalog[kode]!;
    int stok = barang["stok"];
    double harga = barang["harga"].toDouble();
    String kategori = barang["kategori"];
    String nama = barang["nama"];

    if (qty > stok) {
      print('$kode - $nama: Stok tidak cukup (tersedia $stok).');
      return;
    }

    int qtyTagih = qty;

    // Promo beli 5 gratis 1 khusus minuman
    if (kategori == "minuman" && qty >= 6) {
      int gratis = qty ~/ 6;
      qtyTagih -= gratis;
    }

    double subtotal = qtyTagih * harga;

    print('$kode - $nama ($kategori) → Qty: $qty '
        '(tagih: $qtyTagih) × Rp$harga = Rp${subtotal.toStringAsFixed(0)}');

    if (kategori == "snack") {
      totalSnack += subtotal;
    }

    totalBelanja += subtotal;

    katalog[kode]!["stok"] = stok - qtyTagih;
  });

  // Diskon snack 10%
  if (totalSnack > 50000) {
    diskonSnack = totalSnack * 0.10;
    totalBelanja -= diskonSnack;
  }

  // Diskon member 5%
  if (member && totalBelanja > 150000) {
    diskonMember = totalBelanja * 0.05;
    totalBelanja -= diskonMember;
  }

  // Ringkasan
  print('\n=== Ringkasan Transaksi ===');
  if (diskonSnack > 0) {
    print('Diskon snack (10%) : Rp${diskonSnack.toStringAsFixed(0)}');
  }
  if (diskonMember > 0) {
    print('Diskon member (5%): Rp${diskonMember.toStringAsFixed(0)}');
  }

  print('Total akhir       : Rp${totalBelanja.toStringAsFixed(0)}');

  // Stok sisa
  print('\nStok sisa barang yang dibeli:');
  katalog.forEach((kode, data) {
    print('$kode - ${data["nama"]}: ${data["stok"]}');
  });

  print('\n=== Terima kasih telah berbelanja di Hemart! ===');
}
