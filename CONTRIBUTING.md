# Contributing

Dokumen ini menjelaskan cara berkontribusi ke project Bacokan Ucok.

## Ruang Lingkup

Kontribusi yang diterima:

- perbaikan bug
- peningkatan performa
- penyesuaian aset atau UI
- kompatibilitas platform
- pembaruan dokumentasi

## Alur Kerja

1. Buat branch baru dari pekerjaan yang ingin dikerjakan.
2. Lakukan perubahan secara terfokus.
3. Jalankan validasi lokal sebelum mengirimkan hasil.
4. Kirim perubahan dengan penjelasan singkat dan jelas.

## Validasi Minimum

```bash
flutter pub get
flutter analyze
```

Tambahkan pengujian manual atau otomatis bila perubahan menyentuh gameplay, asset loading, atau perilaku lintas platform.

## Standar Perubahan

- Gunakan penamaan yang konsisten dengan project `bacokanucok`
- Jangan memasukkan identitas lama atau metadata pihak lain
- Jaga kompatibilitas Android, iOS, web, dan desktop bila file platform ikut diubah

## Kontak Pemilik

- Slamet Yulianto
- Master Mat Indonesia
- `mastermat711@gmail.com`
