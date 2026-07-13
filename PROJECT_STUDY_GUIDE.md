# Flix ID — Project Study Guide dan Blueprint

Dokumen ini adalah knowledge pack untuk mempelajari project **Flix ID** dan
membuat project Flutter baru dengan pola struktur yang sama. Dokumen ini dapat
diunggah ke ChatGPT sebagai konteks sebelum berdiskusi, meminta penjelasan,
atau mengerjakan studi kasus.

> Catatan keamanan: dokumen ini sengaja tidak menyertakan API key, access
> token, isi `google-services.json`, atau konfigurasi Firebase yang sensitif.

## 1. Ringkasan project

Flix ID adalah aplikasi pemesanan tiket bioskop. Pengguna dapat:

1. register dan login;
2. melihat film yang sedang tayang dan akan datang;
3. melihat detail film dan pemeran;
4. memilih bioskop, tanggal, dan jam;
5. memilih kursi;
6. membayar tiket menggunakan saldo;
7. melihat tiket aktif dan riwayat transaksi;
8. melakukan top-up saldo;
9. mengganti foto profil.

Sumber data yang digunakan:

- **TMDB API**: daftar film, detail film, poster, dan pemeran;
- **Firebase Authentication**: register, login, logout, dan sesi pengguna;
- **Cloud Firestore**: profil pengguna, saldo, dan transaksi;
- **Firebase Storage**: foto profil.

## 2. Teknologi utama

- Flutter dan Dart 3
- Material 3
- Riverpod + Riverpod Generator
- GoRouter
- Freezed
- JSON Serializable
- Dio
- Firebase Core, Auth, Firestore, dan Storage
- Google Fonts
- Image Picker
- Intl

File hasil generator menggunakan akhiran `.g.dart` dan `.freezed.dart`. File
tersebut tidak diedit secara manual.

Perintah umum setelah mengubah model atau provider beranotasi:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Pemeriksaan project:

```bash
flutter analyze
flutter test
```

Saat dokumen ini dibuat, analyzer project bersih, tetapi belum terdapat folder
`test`, sehingga belum ada automated test.

## 3. Arsitektur

Project memakai versi ringan dari Clean Architecture:

```text
UI/Page/Widget
      |
      v
Riverpod State/Controller
      |
      v
Use Case
      |
      v
Repository Interface
      |
      v
Repository Implementation
      |
      v
Firebase / TMDB / sumber data lain
```

Aturan dependensi yang ingin dipertahankan:

- presentation boleh mengenal domain;
- use case bergantung pada kontrak repository, bukan implementasinya;
- implementasi repository menangani Firebase, HTTP, dan serialisasi;
- UI tidak memanggil Firebase atau Dio secara langsung;
- dependency wiring dilakukan melalui Riverpod provider.

### Struktur direktori

```text
lib/
├── main.dart
├── firebase_options.dart
├── data/
│   ├── repositories/       # Kontrak/interface repository
│   ├── firebase/           # Implementasi repository Firebase
│   ├── tmdb/               # Implementasi MovieRepository dari TMDB
│   └── dummies/            # Implementasi dummy untuk belajar/testing
├── domain/
│   ├── entities/           # Model domain Freezed
│   └── usecases/           # Satu folder per aksi bisnis
└── presentation/
    ├── pages/              # Screen dan helper khusus screen
    ├── widgets/            # Widget reusable
    ├── providers/
    │   ├── repositories/   # Provider implementasi repository
    │   ├── usecase/        # Provider untuk use case
    │   ├── movie/          # State/query film
    │   ├── user_data/      # State user aktif
    │   ├── transaction_data/
    │   └── router/
    ├── extensions/
    └── misc/
```

Dalam project ini kontrak repository masih ditempatkan di `data/repositories`.
Pada Clean Architecture yang lebih ketat, kontrak tersebut biasanya berada di
domain. Saat membuat template baru, salah satu pendekatan harus dipilih secara
konsisten.

## 4. Komponen domain

### Entity

- `User`: UUID, email, nama, URL foto, dan saldo.
- `Movie`: data ringkas untuk daftar film.
- `MovieDetail`: overview, runtime, rating, genre, poster, dan backdrop.
- `Actor`: data pemeran.
- `Transaction`: transaksi tiket maupun top-up.

Entity menggunakan Freezed supaya memperoleh immutable data, equality,
`copyWith`, dan dukungan JSON bila diperlukan.

### Result

Repository dan use case tidak melempar error ke presentation sebagai alur
utama. Hasil dibungkus dalam sealed class:

```dart
sealed class Result<T> {
  factory Result.success(T value) = Success;
  factory Result.failed(String message) = Failed;
}
```

Pemanggil dapat menggunakan pattern matching:

```dart
switch (result) {
  case Success(value: final data):
    // gunakan data
  case Failed(message: final message):
    // tampilkan/tangani error
}
```

### Use case

Kontrak generiknya:

```dart
abstract interface class UseCase<R, P> {
  Future<R> call(P params);
}
```

Contoh use case yang tersedia:

- `Login`, `Register`, `Logout`, `GetLoggedInUser`;
- `GetMovieList`, `GetMovieDetail`, `GetActors`;
- `CreateTransaction`, `GetTransactions`;
- `GetUserBalance`, `TopUp`, `UploadProfilePicture`.

Setiap use case mempunyai tanggung jawab kecil. Parameter kompleks dibuatkan
class tersendiri, misalnya `LoginParams` atau `GetMovieListParam`.

## 5. Repository dan dependency injection

Ada empat kontrak utama:

- `Authentication`;
- `UserRepository`;
- `MovieRepository`;
- `TransactionRepository`.

Implementasi konkretnya:

```text
Authentication         -> FirebaseAuthentication
UserRepository         -> FirebaseUserRepository
MovieRepository        -> TmdbMovieRepository
TransactionRepository  -> FirebaseTransactionRepository
```

Riverpod menjadi dependency injection container. Rantai login, misalnya:

```text
LoginPage
  -> userDataProvider.notifier.login(...)
  -> loginProvider
  -> Login use case
  -> authenticationProvider + userRepositoryProvider
  -> FirebaseAuthentication + FirebaseUserRepository
```

Keuntungan pola ini adalah implementasi dapat di-override dengan fake atau
dummy pada test tanpa mengubah use case dan UI.

## 6. State management Riverpod

### `userDataProvider`

Provider keep-alive yang menjadi sumber kebenaran user aktif. Tanggung
jawabnya meliputi:

- memulihkan user berdasarkan sesi Firebase;
- login dan register;
- logout;
- refresh profil/saldo;
- top-up;
- upload foto profil;
- memicu pengambilan film setelah user berhasil masuk.

State-nya berupa `AsyncValue<User?>`:

- loading ketika proses berlangsung;
- data berisi `User` ketika login;
- data `null` ketika tidak login;
- error ketika operasi gagal.

### Provider film

- `nowPlayingProvider`: daftar film sedang tayang;
- `upComingProvider`: daftar film mendatang;
- `movieDetailProvider`: detail film berdasarkan `Movie`;
- `actorsProvider`: pemeran berdasarkan film.

### `transactionDataProvider`

Menampung daftar transaksi user aktif. Provider ini di-refresh setelah
booking atau top-up berhasil.

### Provider repository dan use case

Provider repository membuat implementasi konkret. Provider use case mengambil
kontrak repository tersebut lalu membangun use case. Ini adalah composition
root aplikasi selain `main.dart`.

## 7. Navigasi

GoRouter menyediakan route bernama:

| Nama | Path | Data tambahan |
|---|---|---|
| `login` | `/login` | tidak ada |
| `register` | `/register` | tidak ada |
| `main` | `/main` | opsional `File` foto profil |
| `detail` | `/detail` | `Movie` |
| `time-booking` | `/time-booking` | `MovieDetail` |
| `seat-booking` | `/seat-booking` | record `(MovieDetail, Transaction)` |
| `booking-confirmation` | `/booking-confirmation` | record `(MovieDetail, Transaction)` |
| `wallet` | `/wallet` | tidak ada |

Initial location saat ini adalah `/login`. Halaman utama memakai `PageView`
untuk tiga tab: Home, Ticket, dan Profile.

Data route saat ini dikirim melalui `state.extra` dan type cast. Pendekatan ini
sederhana, tetapi deep link atau refresh web akan kehilangan object tersebut.
Project yang membutuhkan deep linking sebaiknya mengirim ID melalui parameter
URL dan mengambil ulang datanya.

## 8. Alur fitur utama

### Login

```text
Form login
 -> UserData.login
 -> Login use case
 -> Firebase Auth menghasilkan UUID
 -> UserRepository mengambil dokumen users/{uuid}
 -> state berisi User
 -> aplikasi menuju halaman utama
```

### Register

```text
Form register
 -> Firebase Auth membuat akun
 -> Firestore membuat dokumen profil user
 -> state berisi User
 -> daftar film dimuat
```

Jika Auth berhasil tetapi pembuatan profil gagal, akun Firebase dapat terbentuk
tanpa dokumen user. Ini perlu dipertimbangkan pada versi production.

### Memuat film

```text
User berhasil masuk
 -> getMovies() pada provider now playing dan upcoming
 -> GetMovieList
 -> MovieRepository
 -> GET TMDB API
 -> JSON diubah menjadi List<Movie>
 -> UI melakukan watch terhadap AsyncValue
```

### Booking tiket

```text
Movie
 -> detail film
 -> pilih bioskop/tanggal/jam
 -> bentuk Transaction sementara
 -> pilih kursi
 -> hitung jumlah dan harga tiket
 -> halaman konfirmasi menghitung total
 -> CreateTransaction
 -> simpan transaksi Firestore
 -> kurangi saldo user
 -> refresh user dan transaksi
```

Harga tiket saat ini tetap `25.000` per kursi dengan admin fee `3.000`.
Kursi reserved dibuat secara acak di perangkat dan belum bersumber dari
database. Karena itu dua pengguna dapat melihat ketersediaan berbeda.

### Top-up

Top-up memakai model transaksi yang sama dengan booking. Nilai total top-up
dibuat negatif. Repository menghitung:

```text
saldo baru = saldo lama - total transaksi
```

Karena total negatif, saldo bertambah. Cara ini bekerja, tetapi model yang lebih
jelas dapat menggunakan `TransactionType.credit/debit` dan nominal selalu
positif.

## 9. Cara menambah fitur dengan pola yang sama

Misalkan ingin menambah fitur favorit film.

### Langkah 1 — Entity

Buat `FavoriteMovie` atau tentukan apakah `Movie` sudah cukup. Entity tidak
boleh bergantung pada widget atau Firebase SDK.

### Langkah 2 — Kontrak repository

```dart
abstract interface class FavoriteRepository {
  Future<Result<void>> addFavorite(Movie movie, String userId);
  Future<Result<void>> removeFavorite(int movieId, String userId);
  Future<Result<List<Movie>>> getFavorites(String userId);
}
```

### Langkah 3 — Implementasi data

Buat `FirebaseFavoriteRepository`. Di sinilah struktur collection, query,
mapping JSON, dan exception Firebase ditangani.

### Langkah 4 — Use case

Buat `AddFavorite`, `RemoveFavorite`, dan `GetFavorites`. Aturan bisnis berada
di sini, bukan di tombol UI.

### Langkah 5 — Wiring provider

Buat provider repository, provider use case, lalu notifier sebagai state fitur.

### Langkah 6 — UI

UI melakukan `watch` untuk render state dan `read(...notifier)` untuk command.
Tangani loading, success, empty, dan error secara eksplisit.

### Langkah 7 — Test

Override repository provider dengan fake. Uji use case dan notifier tanpa
mengakses Firebase sungguhan.

## 10. Studi kasus pembelajaran

Kerjakan berurutan agar pemahaman bertumbuh dari UI sampai arsitektur.

### Level 1 — UI dan state lokal

1. Tambahkan filter pencarian judul film pada halaman Home.
2. Buat empty state ketika hasil pencarian kosong.
3. Buat validasi form login dan register yang konsisten.
4. Ganti kursi acak dengan data statis yang deterministik agar mudah diuji.

Fokus belajar: widget composition, state lokal, form, dan rendering list.

### Level 2 — Riverpod

1. Buat provider query pencarian dan derived provider untuk hasil filter.
2. Tambahkan tombol retry ketika TMDB gagal.
3. Pertahankan error login di state tanpa langsung menimpanya dengan data null.
4. Bersihkan state transaksi ketika user logout.

Fokus belajar: `ref.watch`, `ref.read`, notifier, `AsyncValue`, invalidation,
dan lifecycle provider.

### Level 3 — Use case dan repository

1. Tambahkan fitur favorit menggunakan urutan pada bagian sebelumnya.
2. Tambahkan pagination untuk now playing dan upcoming.
3. Buat `FakeMovieRepository` dan gunakan untuk mode demo.
4. Pisahkan transaksi top-up dan pembelian dengan tipe transaksi.

Fokus belajar: dependency inversion, interface, mapping, dan aturan bisnis.

### Level 4 — Firebase dan konsistensi data

1. Gunakan Firestore transaction/batch untuk menyimpan booking dan mengurangi
   saldo secara atomik.
2. Simpan ketersediaan kursi berdasarkan film, bioskop, dan jadwal.
3. Cegah double booking dengan validasi di server/transaction.
4. Tambahkan rollback/cleanup jika register Auth berhasil tetapi profil gagal.
5. Gunakan path Storage yang unik seperti `users/{uuid}/profile/avatar.jpg`.

Fokus belajar: concurrency, atomicity, authorization, dan data modeling.

### Level 5 — Testing

1. Unit test `Login`, `Register`, `TopUp`, dan `CreateTransaction`.
2. Test provider menggunakan `ProviderContainer` dan override repository.
3. Widget test untuk validasi login dan pemilihan kursi.
4. Integration test untuk alur booking dengan Firebase Emulator.

Fokus belajar: fake, mock, dependency override, dan test pyramid.

### Level 6 — Production readiness

1. Pindahkan TMDB token dari source code ke konfigurasi build seperti
   `--dart-define` atau backend proxy.
2. Tambahkan auth-aware redirect pada GoRouter.
3. Gunakan route parameter ID agar deep link dapat dipulihkan.
4. Tambahkan logging/crash reporting tanpa membocorkan credential dan PII.
5. Buat environment development, staging, dan production.
6. Tambahkan CI untuk format, analyze, generator check, dan test.

## 11. Risiko dan technical debt yang perlu dikenali

Ini bukan berarti project tidak dapat dipakai untuk belajar. Justru poin-poin
ini cocok menjadi bahan studi kasus refactoring:

- TMDB access token berada langsung di source code;
- README asli masih sangat minimal;
- belum ada automated test;
- transaksi booking dan perubahan saldo belum atomik;
- repository transaksi membuat `FirebaseUserRepository` secara langsung,
  sehingga dependency injection terlewati;
- reserved seat hanya data acak lokal;
- error dari beberapa provider diubah menjadi list kosong sehingga penyebab
  kegagalan tidak terlihat di UI;
- beberapa akses menggunakan null assertion (`!`) dan bergantung pada urutan
  navigasi yang benar;
- object route dikirim melalui `extra`, sehingga tidak tahan refresh/deep link;
- penamaan `teather` dan `Upcomming` mengandung typo;
- transaksi tiket belum memiliki status seperti pending, paid, cancelled,
  expired, atau refunded;
- timestamp bercampur antara milliseconds dan microseconds pada beberapa alur;
- operasi network belum memiliki strategi timeout, retry, atau cache yang jelas.

## 12. Blueprint project baru

Untuk membuat starter/boilerplate dengan pola serupa, gunakan struktur berikut:

```text
lib/
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme.dart
├── core/
│   ├── error/
│   ├── result/
│   ├── network/
│   └── config/
├── data/
│   ├── datasources/
│   ├── dto/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── pages/
│   ├── widgets/
│   └── providers/
└── main.dart
```

Perbedaan yang disarankan dari project saat ini:

- letakkan interface repository di domain;
- bedakan entity domain dengan DTO/API model;
- pusatkan config dan endpoint;
- injeksikan seluruh dependency, termasuk dependency antar-repository;
- buat test sejak fitur pertama;
- jangan commit secret;
- modelkan status loading, empty, error, dan success dengan jelas.

## 13. Checklist satu fitur baru

Gunakan checklist ini setiap kali meminta ChatGPT membantu implementasi:

- [ ] kebutuhan dan aturan bisnis sudah jelas;
- [ ] entity/domain model sudah ditentukan;
- [ ] kontrak repository ditambah atau diperbarui;
- [ ] implementasi repository menangani error eksternal;
- [ ] use case hanya berisi satu tujuan bisnis;
- [ ] dependency dihubungkan melalui Riverpod;
- [ ] provider memiliki loading, data, empty, dan error state;
- [ ] UI tidak memanggil data source secara langsung;
- [ ] route dan parameter aman terhadap null/type mismatch;
- [ ] unit/widget test ditambahkan;
- [ ] `build_runner`, formatter, analyzer, dan test dijalankan;
- [ ] tidak ada credential di source code atau output log.

## 14. Prompt awal untuk ChatGPT

Setelah mengunggah dokumen ini, gunakan prompt berikut:

```text
Gunakan PROJECT_STUDY_GUIDE.md sebagai sumber konteks utama.

Saya sedang belajar Flutter melalui project Flix ID dan ingin mempertahankan
pola arsitektur data-domain-presentation, repository, use case, Riverpod, dan
GoRouter yang dijelaskan di dokumen.

Saat menjawab:
1. jelaskan alur dari UI sampai data source;
2. tunjukkan file/layer yang perlu dibuat atau diubah;
3. jangan menaruh aturan bisnis di widget;
4. jangan mengedit file generator secara manual;
5. jelaskan trade-off dan potensi error;
6. sertakan strategi test;
7. jangan pernah menuliskan credential asli.

Pertanyaan/studi kasus saya:
[TULIS PERTANYAAN DI SINI]
```

## 15. Contoh pertanyaan untuk sesi belajar

- Jelaskan alur login project ini seolah saya baru belajar Riverpod.
- Mengapa repository memakai `Result<T>` dan bukan langsung melempar exception?
- Buat diagram dependency untuk fitur booking.
- Bantu saya membuat fitur favorite dengan pola yang sama, satu langkah dahulu.
- Tunjukkan cara menguji `TopUp` menggunakan fake repository.
- Apa masalah concurrency pada proses pemesanan tiket saat ini?
- Bagaimana mengubah booking agar memakai Firestore transaction?
- Bagaimana membuat router otomatis mengarahkan user berdasarkan auth state?
- Bagaimana memisahkan DTO TMDB dari entity domain?
- Review kode yang saya kirim berdasarkan checklist pada dokumen ini.

## 16. Instruksi perilaku untuk AI

Jika dokumen ini dipakai sebagai knowledge file, AI diharapkan:

1. mengutamakan penjelasan yang membantu proses belajar, bukan hanya memberikan
   kode jadi;
2. menanyakan tingkat pemahaman hanya jika benar-benar memengaruhi jawaban;
3. membagi implementasi besar menjadi tahap kecil yang dapat diverifikasi;
4. mempertahankan dependency direction dan pola project;
5. menandai jika usulan merupakan perbaikan dari struktur asli;
6. tidak mengasumsikan generated file boleh diedit;
7. memberi tahu perintah generator/analyzer/test yang relevan;
8. menyebutkan bila solusi memerlukan perubahan Firebase Rules, index, atau
   konfigurasi eksternal;
9. tidak mengarang isi file project yang belum diberikan;
10. tidak meminta atau menampilkan API key dan credential.

