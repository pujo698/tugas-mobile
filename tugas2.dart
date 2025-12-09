void main() {
  print('=================================');
  print('Nama: Wahid Sandy Pujo Dzulhijayanto');
  print('NIM : 32602300015');
  print('=================================\n');
  // Data contoh AQI mingguan (Senin → Minggu)
  List<int> aqiMingguan = [45, 78, 110, 95, 155, 85, 60];
  // Data acara luar ruang (true jika ada kegiatan di luar ruangan)
  List<bool> acaraLuarRuang = [false, true, false, true, false, false, true];

  // Variabel ringkasan
  int baik = 0, sedang = 0, sensitif = 0, tidakSehat = 0;
  int totalAQI = 0;
  int streakBaik = 0;
  int streakTerpanjang = 0;

  List<String> hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];

  print('=== Laporan Kualitas Udara Kota SehatJaya ===');

  // Proses data harian
  for (int i = 0; i < aqiMingguan.length; i++) {
    int aqi = aqiMingguan[i];
    bool acara = acaraLuarRuang[i];
    String kategori = '';
    String rekomendasi = '';

    // Tentukan kategori berdasarkan nilai AQI
    if (aqi <= 50) {
      kategori = 'Baik';
      baik++;
      streakBaik++;
      if (streakBaik > streakTerpanjang) streakTerpanjang = streakBaik;
    } else {
      streakBaik = 0; // reset streak
      if (aqi <= 100) {
        kategori = 'Sedang';
        sedang++;
        if (acara) rekomendasi = 'Masker dianjurkan';
      } else if (aqi <= 150) {
        kategori = 'Tidak Sehat bagi Kelompok Sensitif';
        sensitif++;
      } else {
        kategori = 'Tidak Sehat';
        tidakSehat++;
        if (i >= 5) rekomendasi = 'Pertimbangkan di rumah'; // Sabtu/Minggu
      }
    }

    totalAQI += aqi;

    print('${hari[i]} - AQI: $aqi → $kategori ${rekomendasi.isNotEmpty ? "($rekomendasi)" : ""}');
  }

  // Hitung rata-rata AQI mingguan
  double rataRata = totalAQI / aqiMingguan.length;

  // Tampilkan ringkasan
  print('\n=== Ringkasan Mingguan ===');
  print('Hari "Baik"                 : $baik');
  print('Hari "Sedang"               : $sedang');
  print('Hari "Sensitif"             : $sensitif');
  print('Hari "Tidak Sehat"          : $tidakSehat');
  print('Rata-rata AQI               : ${rataRata.toStringAsFixed(2)}');
  print('Streak terpanjang "Baik"    : $streakTerpanjang hari');
  print('===============================');
  print('===============================');
}
