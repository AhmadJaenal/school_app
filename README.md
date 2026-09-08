# school_app

## API dan Clean Architecture

Integrasi API Laravel `api-attendance` berada di `lib/features` dan dipisahkan menjadi:

- `data`: remote data source, model response, dan repository implementation.
- `domain`: entity, kontrak repository, dan use case.
- `core`: konfigurasi API, Dio client, token storage, dan dependency injection.

Base URL default untuk Android emulator adalah `http://10.0.2.2:8000/api/v1`.
Untuk perangkat fisik atau environment lain, jalankan dengan:

```bash
flutter run --dart-define=API_BASE_URL=http://192.168.x.x:8000/api/v1
```

Endpoint attendance yang sudah tersedia melalui use case:

- `POST /auth/login`, `POST /auth/logout`, `POST /auth/refresh-token`
- `GET /attendance`
- `POST /attendance/check-in`
- `POST /attendance/check-out`

Token disimpan melalui `ApiClient` setelah login dan otomatis dikirim sebagai Bearer token.
Bloc dapat dibuat di `features/<feature>/presentation/bloc` dengan memakai use case dari domain.

Seluruh endpoint `api/v1` Laravel lainnya tersedia melalui
`SchoolApiRemoteDataSource`:

- Classes dan siswa: CRUD kelas, daftar siswa, tambah, pindah, dan hapus siswa.
- Subjects: daftar/detail, tambah, assign teacher, teacher list, update, hapus.
- Exams: CRUD, questions, start, answer, submit, essay grading, results, my-result.
- Parent dan daily tests: link student, daftar/tambah daily test, bulk grades.
- Notifications: daftar, tambah, mark read, unread count.
- Statistics: student grades/attendance/rapor, class grades/attendance, school overview.
- Attendance: detail, update, delete, GPS log, dan daftar GPS log.

Remote data source ini berada di
`lib/features/school/data/datasources/school_api_remote_data_source.dart`.
Request body dan query parameter diteruskan dalam bentuk `Map<String, dynamic>` agar
Bloc dapat menentukan form sesuai role dan layar tanpa mencampur HTTP dengan UI.

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# school_app
