# 🩸 Setetes: Sistem Informasi & Manajemen Donor Darah Terintegrasi

[![Flutter](https://img.shields.io/badge/Flutter-Frontend-02569B?style=flat&logo=flutter)](https://flutter.dev/)
[![Node.js](https://img.shields.io/badge/Node.js-Backend-339933?style=flat&logo=node.js)](https://nodejs.org/)
[![Supabase](https://img.shields.io/badge/Supabase-Database-3ECF8E?style=flat&logo=supabase)](https://supabase.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Status: Prototype](https://img.shields.io/badge/Status-Prototype-orange.svg)]()

> **Wujudkan Kepedulian. Satu Tetes untuk Selamatkan Kehidupan.**
> 
> Proyek aplikasi *mobile* untuk mendigitalisasi distribusi informasi antara Unit Transfusi Darah (UTD) Palang Merah Indonesia (PMI) dan masyarakat luas.

---

## 📖 Latar Belakang

Sistem informasi ketersediaan kantong darah di berbagai daerah seringkali mengandalkan pembaruan manual melalui status media sosial (WhatsApp/Instagram) dengan jeda waktu (*latency*) 1x24 jam. Keterlambatan informasi ini dapat berakibat fatal pada situasi gawat darurat medis. 

**Setetes** hadir untuk menyelesaikan permasalahan tersebut dengan menyediakan platform pemantauan stok darah *real-time*, informasi kegiatan donor darah keliling, dan layanan kesehatan terkait lainnya di genggaman tangan, guna meningkatkan partisipasi pendonor aktif khususnya di wilayah Daerah Istimewa Yogyakarta dan sekitarnya.

---

## ✨ Fitur Unggulan

*   🔐 **Autentikasi Aman:** Sistem Registrasi dan Login pengguna terenkripsi menggunakan Supabase Auth.
*   📊 **Dasbor Stok Darah Real-Time:** Visualisasi tabel dinamis ketersediaan komponen darah (WB, PRC, TC) dari berbagai PMI Kabupaten/Kota (seperti PMI Kabupaten Bantul) yang tersinkronisasi seketika.
*   🚐 **Jadwal Mobile Donor:** Informasi lokasi dan jadwal kegiatan donor darah keliling terdekat secara interaktif.
*   🆘 **Permintaan Darah:** Alur pengajuan kebutuhan darah secara digital yang terpusat.
*   📰 **Edukasi & Breaking News:** *Banner* interaktif untuk menyebarkan informasi kesiapsiagaan bencana, pertolongan pertama, dan kesehatan.

---

## 🛠️ Tech Stack & Arsitektur

Proyek ini memisahkan arsitektur *Client* dan *Server* untuk menjamin performa dan skalabilitas yang lebih baik:

### Frontend (Mobile App)
*   **Framework:** [Flutter](https://flutter.dev/)
*   **Bahasa:** Dart
*   **Arsitektur UI:** Material Design 3

### Backend & Database
*   **Runtime API:** [Node.js](https://nodejs.org/)
*   **BaaS (Backend-as-a-Service):** [Supabase](https://supabase.com/) (berbasis PostgreSQL)
*   **Keamanan Data:** Row Level Security (RLS) terintegrasi

---

## 📂 Struktur Direktori

```text
setetes_mobile/
├── backend/                # Kode sumber server Node.js & integrasi API
│   ├── src/                # Logika utama backend dan routes
│   ├── .env.example        # Contoh format environment variables (Kredensial)
│   ├── package.json        # Konfigurasi dependensi Node.js
│   └── server.js           # Entry point aplikasi backend
├── lib/                    # Kode sumber frontend Flutter
│   ├── screens/            # Antarmuka Halaman (Splash, Login, Register, Home)
│   ├── widgets/            # Komponen UI dinamis yang dapat digunakan ulang
│   └── main.dart           # Entry point aplikasi mobile Flutter
├── assets/                 # Aset statis (Gambar, ikon, dan logo PMI)
└── pubspec.yaml            # Konfigurasi dependensi packages Flutter
```

---

## ⚙️ Prasyarat (Prerequisites)

Sebelum menjalankan proyek ini di mesin lokal, pastikan *environment* Anda sudah terinstal:
*   [Flutter SDK](https://docs.flutter.dev/get-started/install) (Versi stabil terbaru)
*   [Node.js](https://nodejs.org/en/download/) (Versi LTS)
*   [Git](https://git-scm.com/)
*   Editor kode pilihan (Sangat disarankan **VS Code** atau **Android Studio**)

---

## 🚀 Panduan Instalasi & Setup Lokal

Ikuti langkah-langkah di bawah ini untuk menjalankan aplikasi secara penuh dari laptop/komputer Anda:

### 1. Clone Repositori
Jalankan perintah ini di terminal Anda:
```bash
git clone [https://github.com/username-kamu/setetes-mobile.git](https://github.com/username-kamu/setetes-mobile.git)
cd setetes-mobile
```

### 2. Setup Backend (Node.js & Supabase)
1. Masuk ke direktori backend:
   ```bash
   cd backend
   ```
2. Instal semua dependensi server:
   ```bash
   npm install
   ```
3. **Konfigurasi Kredensial (.env):**
   * Buat file baru bernama `.env` di dalam folder `backend` (Pastikan file `.env` sudah masuk ke dalam `.gitignore`).
   * Buka file `.env` tersebut dan masukkan API Key proyek Supabase Anda sesuai format berikut:
     ```env
     SUPABASE_URL=https://[PROJECT-ID].supabase.co
     SUPABASE_ANON_KEY=[YOUR-ANON-KEY]
     PORT=3000
     ```
4. Jalankan server lokal:
   ```bash
   npm start
   # Server backend akan berjalan di http://localhost:3000
   ```

### 3. Setup Frontend (Flutter)
1. Buka tab terminal baru dan pastikan Anda berada di direktori utama `setetes-mobile`:
   ```bash
   cd setetes-mobile
   ```
2. Unduh dan instal *packages* Flutter yang dibutuhkan:
   ```bash
   flutter pub get
   ```
3. Hubungkan perangkat fisik (via USB Debugging) atau jalankan Emulator (Android/iOS) di laptop Anda.
4. *Compile* dan jalankan aplikasi:
   ```bash
   flutter run
   ```

---

## 📱 Tangkapan Layar (Screenshots)

*(Ganti URL placeholder di bawah ini dengan link gambar screenshot aplikasimu yang sebenarnya)*

| Splash Screen | Halaman Login | Dasbor Utama (Stok Darah) |
| :---: | :---: | :---: |
| <img src="https://via.placeholder.com/200x400.png?text=Splash+Screen" width="200"/> | <img src="https://via.placeholder.com/200x400.png?text=Login+Screen" width="200"/> | <img src="https://via.placeholder.com/200x400.png?text=Home+Screen" width="200"/> |

---

## 🤝 Kontribusi (Contributing)

Setetes saat ini berada pada tahap **Purwarupa (Prototype)**. Kami sangat menyambut masukan, laporan *bug*, maupun kontribusi langsung dari komunitas pengembang maupun relawan lapangan. 

1. *Fork* repositori ini
2. Buat *branch* fitur Anda (`git checkout -b feature/FiturBaru`)
3. *Commit* perubahan Anda (`git commit -m 'Menambahkan Fitur Baru yang Keren'`)
4. *Push* ke branch (`git push origin feature/FiturBaru`)
5. Buka *Pull Request*

---

## 📄 Lisensi

Proyek ini didistribusikan di bawah Lisensi MIT. Lihat file `LICENSE` untuk informasi lebih detail.

---
*Dikembangkan dengan dedikasi untuk kemanusiaan.* ❤️
