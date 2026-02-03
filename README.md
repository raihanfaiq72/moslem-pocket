# Moslem Pocket

Moslem Pocket adalah aplikasi asisten ibadah harian Muslim yang dirancang dengan antarmuka modern (iPhone Style) dan fitur lengkap untuk menemani aktivitas ibadah sehari-hari. Aplikasi ini bertujuan menjadi teman setia umat Muslim dengan pengalaman pengguna yang nyaman, estetis, dan fungsional.

## 🧱 Fitur Wajib (Core / MVP)
Fitur-fitur utama yang menjadi pondasi aplikasi Moslem Pocket:

### 1️⃣ Waktu Sholat + Adzan
*   **Otomatis Berdasarkan Lokasi**: Mendeteksi lokasi pengguna secara akurat untuk jadwal sholat yang tepat.
*   **Metode Perhitungan**: Pilihan beragam (Kemenag, MWL, ISNA, dll).
*   **Notifikasi Adzan**: Opsi Adzan Full, Silent, atau Getar.
*   **Reminder**: Peringatan sebelum waktu sholat tiba.

### 2️⃣ Arah Kiblat
*   **Kompas Kiblat Presisi**: Penunjuk arah kiblat dengan visual yang jelas.
*   **Akurasi GPS**: Menggunakan sensor perangkat untuk ketepatan tinggi.
*   **Kalibrasi**: Mode bantuan untuk kalibrasi kompas.

### 3️⃣ Al-Qur’an Digital
*   **Teks Arab & Terjemahan**: Lengkap dengan terjemahan Bahasa Indonesia.
*   **Kustomisasi Tampilan**: Pilihan jenis font dan ukuran teks yang nyaman dibaca.
*   **Fitur Baca**: Bookmark ayat dan penanda "Last Read".
*   **Mode Offline**: Dapat diakses tanpa koneksi internet.

### 4️⃣ Doa & Dzikir Harian
*   **Kumpulan Doa**: Doa pagi-petang, doa harian, dan doa setelah sholat.
*   **Audio**: Dilengkapi dengan audio pelafalan (Nilai Plus).

### 5️⃣ Kalender Hijriyah
*   **Konversi Tanggal**: Informasi tanggal Hijriyah hari ini.
*   **Hari Besar Islam**: Info dan pengingat hari-hari penting dalam Islam.

---

## ✨ Fitur Pembeda (Differentiators)
Fitur unggulan yang membedakan Moslem Pocket dari aplikasi sejenis:

### 🌙 Ibadah Tracker
*   **Checklist Sholat**: Pantau kedisiplinan sholat 5 waktu.
*   **Puasa Sunnah**: Pengingat dan pencatatan puasa sunnah (Senin-Kamis, Ayyamul Bidh).
*   **Target Mingguan**: Tetapkan dan capai target ibadah pribadi.

### 📿 Tasbih Digital
*   **Haptic Feedback**: Getaran setiap hitungan 33/99.
*   **Statistik**: Riwayat dzikir harian.
*   **Dark Mode**: Mode hemat baterai dan nyaman di mata (OLED friendly).

### 🕌 Masjid Terdekat
*   **Locator**: Temukan masjid terdekat berdasarkan GPS.
*   **Info Fasilitas**: Detail fasilitas (Toilet, Parkir, Wudhu).
*   **Jadwal Masjid**: Info jam iqomah/sholat spesifik masjid (jika tersedia).

### 📖 Tafsir Ringkas
*   **Per Ayat**: Penjelasan tafsir yang mudah dipahami per ayat.
*   **Bahasa Sederhana**: Disajikan dengan bahasa yang ringan.
*   **Simpan**: Fitur menyimpan tafsir favorit.

### 🎧 Audio Murottal
*   **Multi Qari**: Pilihan berbagai Qari ternama.
*   **Download Manager**: Unduh untuk didengarkan secara offline.

---

## ⚠️ Poin Penting & Privacy
*   **Akurasi Waktu**: Penjelasan transparan mengenai metode perhitungan waktu sholat.
*   **Sumber Data**: Mencantumkan sumber Al-Qur'an dan Tafsir yang digunakan (Kemenag/Tanzil/dll).
*   **Humble Claim**: Tidak mengklaim "Paling Akurat", namun berupaya memberikan data terbaik.
*   **Privacy Policy**: Penjelasan jelas penggunaan izin Lokasi (untuk Waktu Sholat & Kiblat) dan Notifikasi.

---

## 🎯 Struktur Modul (Technical Architecture)
Aplikasi ini dibangun menggunakan Flutter dengan pendekatan modular agar mudah dikembangkan (*maintainable*) dan *scalable*. Berikut adalah struktur modul yang direncanakan:

```
lib/
├── modules/
│   ├── auth/          # Otentikasi (Login/Register - Optional)
│   ├── prayer_time/   # Fitur Waktu Sholat & Adzan
│   ├── quran/         # Al-Qur'an, Surah, Ayat, Audio
│   ├── qibla/         # Kompas Arah Kiblat
│   ├── dua_dzikir/    # Kumpulan Doa & Dzikir
│   ├── tasbih/        # Tasbih Digital
│   ├── tracker/       # Ibadah Tracker (Sholat, Puasa)
│   ├── settings/      # Pengaturan Aplikasi & Tema
│   └── premium/       # Fitur Berbayar/Donasi (Future)
├── core/              # Komponen Shared (Network, Database, Utilities)
└── shared/            # Widget Reusable & Resources (Colors, Themes)
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
