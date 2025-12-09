import 'dart:io';

void main() {
  // Inisialisasi data gudang dalam bentuk Map
  Map<String, Map<String, Object>> gudang = {
    "A01": {"nama": "Earphone", "stok": 12, "harga": 99000},
    "A02": {"nama": "Powerbank", "stok": 8, "harga": 250000},
    "A03": {"nama": "Charger", "stok": 15, "harga": 75000},
    "A04": {"nama": "Smartwatch", "stok": 5, "harga": 550000},
    "A05": {"nama": "USB Cable", "stok": 20, "harga": 30000},
  };

  print('=== Aplikasi GudangGawai ===');
  print('Daftar kode barang: ${gudang.keys.join(", ")}');
  stdout.write('Masukkan kode barang yang ingin dicari: ');
  String kode = stdin.readLineSync()!.toUpperCase();

  if (gudang.containsKey(kode)) {
    var barang = gudang[kode]!;
    print('\nDetail Barang:');
    print('Nama  : ${barang["nama"]}');
    print('Stok  : ${barang["stok"]}');
    print('Harga : Rp${barang["harga"]}');
  } else {
    print('\nKode barang tidak ditemukan.');
    return;
  }

  // Update stok
  stdout.write('\nMasukkan perubahan stok (contoh: +5 atau -3): ');
  int perubahan = int.parse(stdin.readLineSync()!);
  var stokSekarang = gudang[kode]!["stok"] as int;
  int stokBaru = stokSekarang + perubahan;

  if (stokBaru < 0) {
    print('Perubahan stok ditolak: stok tidak boleh negatif.');
  } else {
    gudang[kode]!["stok"] = stokBaru;
    print('Stok berhasil diperbarui menjadi $stokBaru.');
  }

  // Tampilkan daftar barang dengan harga > 200000
  print('\n=== Barang dengan harga > 200000 ===');
  gudang.forEach((k, v) {
    if ((v["harga"] as int) > 200000) {
      print('${v["nama"]} (Rp${v["harga"]})');
    }
  });

  // Cetak seluruh kode dan nama barang
  print('\nDaftar semua barang:');
  gudang.forEach((kode, detail) {
    print('$kode - ${detail["nama"]}');
  });
}
