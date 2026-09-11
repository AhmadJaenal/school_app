# Brief: Standarisasi Clean Architecture — School App (Flutter)

## Konteks

Project `school_app` (Flutter, state management BLoC/Cubit, error handling `dartz` Either) menerapkan Clean Architecture, tapi implementasinya **tidak konsisten** antar fitur. Beberapa fitur (`classes`, `exam`, `statistics`) sudah dirapikan mengikuti pola yang benar, tapi fitur lain kemungkinan masih menyimpang. Tugas: audit seluruh fitur di `lib/features/`, temukan penyimpangan dari pola standar di bawah, dan perbaiki agar seluruh project konsisten.

**Prinsip utama yang WAJIB dipegang:** Domain layer (Entity, UseCase, Repository interface) tidak boleh punya dependency ke Data layer (Model, DataSource, RepositoryImpl) dengan cara apapun. Arah dependency selalu: `Data → Domain ← Presentation`.

---

## 1. Struktur Layer yang Benar

Untuk **setiap fitur** di `lib/features/<nama_fitur>/`, struktur foldernya:

```
<fitur>/
├── domain/
│   ├── entities/          → representasi bisnis murni, extends Equatable
│   └── repositories/      → abstract interface, HANYA pakai Entity
├── data/
│   ├── models/            → extends Entity yang sepadan, punya fromJson/toJson
│   ├── datasources/       → abstract + impl, HANYA pakai Model
│   └── repositories/      → implements Repository (domain), mapping Model→Entity
└── presentation/
    ├── cubit/ (atau bloc/) → HANYA pakai Entity, extends BaseCubit<T>
    └── pages/ atau widgets/ → HANYA pakai Entity
```

### Tabel tipe per layer (acuan wajib)

| Layer | File | Tipe yang dipakai | Boleh return `Either<Failure, T>`? |
|---|---|---|---|
| Entity | `domain/entities/*.dart` | — | — |
| Repository interface | `domain/repositories/*.dart` | **Entity** | Ya |
| DataSource (abstract + impl) | `data/datasources/*.dart` | **Model** | Ya |
| RepositoryImpl | `data/repositories/*.dart` | **Entity** (delegasi ke DataSource yang return Model, valid via covariance) | Ya |
| UseCase | `domain/usecases/*.dart` (kalau dipakai) | **Entity** | Ya |
| Cubit/Bloc | `presentation/cubit/*.dart` | **Entity** (sebagai generic `BaseCubit<T>`) | — (fold di dalam) |
| UI/Widget | `presentation/pages/*.dart` | **Entity** | — |

**Aturan besi:** kata `Model` tidak boleh muncul di import manapun pada folder `domain/` atau `presentation/`. Kalau ditemukan, itu bug.

---

## 2. Pola Entity

```dart
import 'package:equatable/equatable.dart';

class XxxEntity extends Equatable {
  const XxxEntity({
    this.field1,
    this.field2,
  });

  final String? field1;
  final int? field2;

  @override
  List<Object?> get props => [field1, field2];
}
```

Untuk entity yang extends entity lain (relasi detail/summary):
```dart
class XxxDetailEntity extends XxxEntity {
  const XxxDetailEntity({
    super.field1,
    super.field2,
    this.extraField,
  });

  final String? extraField;

  @override
  List<Object?> get props => [...super.props, extraField];
}
```

**Checklist wajib per Entity:**
- [ ] `extends Equatable`
- [ ] Semua field yang dideklarasikan **ikut masuk ke `props`** (termasuk field warisan lewat `...super.props` kalau ada parent)
- [ ] Field bertipe nullable (`String?`, `int?`, dst) kecuali memang benar-benar wajib ada
- [ ] Field relasi (nested object) bertipe **Entity lain**, bukan Model (misal `AcademicYearEntity? academicYear`, bukan `AcademicYear`)

---

## 3. Pola Model

```dart
import 'package:school_app/features/xxx/domain/entities/xxx_entities.dart';

class XxxModel extends XxxEntity {
  const XxxModel({
    super.field1,
    super.field2,
  });

  factory XxxModel.fromJson(Map<String, dynamic> json) {
    return XxxModel(
      field1: json['field1'] as String?,
      field2: json['field2'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'field1': field1,
    'field2': field2,
  };
}
```

**Checklist wajib per Model:**
- [ ] `extends XxxEntity` yang BENAR (cek typo nama class — pernah ditemukan kasus `extends ExamStudentSum` yang seharusnya `extends ExamStudentEntity`)
- [ ] Constructor pakai `super.xxx` untuk SEMUA field yang sudah ada di Entity — **JANGAN redeclare field** (`final String? id;` lalu `this.id` di constructor) karena menyebabkan shadowing dan Equatable jadi salah baca field
- [ ] `fromJson` null-safe: pakai `as String?`, bukan `as String` kalau field-nya nullable di Entity. Kalau field JSON bisa `null` untuk nested object, cek dulu (`json['x'] != null ? Model.fromJson(...) : null`)
- [ ] Nested object di Model pakai Model lain (misal `AcademicYearModel`, bukan `AcademicYear` tanpa suffix) — dan Model itu juga harus extends Entity-nya
- [ ] List nested pakai helper `_readList<T>()` (whereType + map + toList) untuk menghindari crash kalau field null atau bukan List
- [ ] Model TIDAK perlu override `props` kalau field-nya sama persis dengan Entity (sudah diwariskan). Override `props` HANYA kalau Model punya field tambahan yang Entity tidak punya

---

## 4. Pola DataSource

```dart
abstract class XxxRemoteDataSource {
  Future<Either<Failure, PaginationResult<XxxModel>>> getXxxList();
  Future<Either<Failure, XxxModel>> getXxxDetail(int id);
}

class XxxRemoteDataSourceImpl extends RepositoryHelper
    implements XxxRemoteDataSource {
  @override
  Future<Either<Failure, PaginationResult<XxxModel>>> getXxxList() {
    final dioCall = dioClient.getRequest(URLs.xxx);
    return callApiWithPaginationData(
      api: dioCall,
      jsonCallback: (json) => XxxModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, XxxModel>> getXxxDetail(int id) {
    final dioCall = dioClient.getRequest(URLs.xxxDetail(id));
    return callApi(api: dioCall, jsonCallback: (json) => XxxModel.fromJson(json));
  }
}
```

**Checklist wajib per DataSource:**
- [ ] Abstract class dan implementasinya **berada di file/layer yang sama** (data layer) — ini beda dengan Repository (lihat poin 6)
- [ ] Semua method return **Model**, tidak boleh ada Entity yang nyasar ke sini
- [ ] Tidak ada nama method duplikat dalam satu abstract class
- [ ] Pakai helper `callApi` / `callApiWithPaginationData` / `callApiBool` dari `RepositoryHelper` secara konsisten — jangan campur try-catch manual di sini kalau helper sudah handle exception→Either

---

## 5. Pola Repository Interface (domain layer)

```dart
import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/xxx/domain/entities/xxx_entities.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class XxxRepository {
  Future<Either<Failure, PaginationResult<XxxEntity>>> getXxxList();
  Future<Either<Failure, XxxEntity>> getXxxDetail(int id);
}
```

**Checklist wajib:**
- [ ] File berada di `domain/repositories/`
- [ ] Import HANYA dari `domain/entities/` — TIDAK BOLEH import apapun dari `data/models/`
- [ ] Semua return type pakai Entity

---

## 6. Pola Repository Implementation (data layer)

```dart
import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/xxx/data/datasources/xxx_remote_datasource.dart';
import 'package:school_app/features/xxx/domain/entities/xxx_entities.dart';
import 'package:school_app/features/xxx/domain/repositories/xxx_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class XxxRepositoryImpl implements XxxRepository {
  XxxRepositoryImpl(this._dataSource);
  final XxxRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, PaginationResult<XxxEntity>>> getXxxList() =>
      _dataSource.getXxxList();

  @override
  Future<Either<Failure, XxxEntity>> getXxxDetail(int id) =>
      _dataSource.getXxxDetail(id);
}
```

**Poin penting:** karena `XxxModel extends XxxEntity` (Model adalah subclass Entity), Dart generic bersifat **covariant** — `Either<Failure, XxxModel>` otomatis valid dikembalikan sebagai `Either<Failure, XxxEntity>` TANPA perlu `.map()` manual. Ini berlaku juga untuk `PaginationResult<Model>` → `PaginationResult<Entity>`.

**`.map()` manual HANYA dibutuhkan kalau:**
- Model tidak extends Entity yang sepadan (harus diperbaiki relasi inheritance-nya dulu, idealnya)
- Ada transformasi struktur data yang beda antara Model dan Entity

**Checklist wajib:**
- [ ] `implements XxxRepository` (dari domain), BUKAN mendefinisikan abstract sendiri di data layer
- [ ] Semua method return Entity, delegasi langsung ke `_dataSource.xxx()` (tanpa logic tambahan kalau tidak perlu)
- [ ] Import Model TIDAK BOLEH ada di file ini kecuali benar-benar dibutuhkan untuk `.map()` manual (kasus di atas)

---

## 7. Pola UseCase (domain layer) — kalau dipakai

```dart
import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/xxx/domain/entities/xxx_entities.dart';
import 'package:school_app/features/xxx/domain/repositories/xxx_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class GetXxxList {
  GetXxxList(this._repository);
  final XxxRepository _repository;
  Future<Either<Failure, PaginationResult<XxxEntity>>> call() =>
      _repository.getXxxList();
}
```

**Checklist wajib:**
- [ ] Satu class per use case, method `call()`
- [ ] Return type Entity, sama persis dengan Repository interface
- [ ] Tidak ada import Model sama sekali

**Catatan:** kalau project ini memutuskan skip UseCase layer untuk fitur CRUD sederhana (Cubit langsung panggil Repository), itu valid asal konsisten diterapkan di semua fitur sejenis — jangan campur (sebagian fitur pakai UseCase, sebagian tidak, tanpa alasan jelas).

---

## 8. Pola BaseCubit (base class, dipakai semua fitur)

```dart
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/error/failure.dart';

abstract class BaseCubit<T> extends Cubit<DataState<T>> {
  BaseCubit() : super(const DataState.initial());

  Future<void> fetchData(
    Future<Either<Failure, T>> Function() request,
  ) async {
    emit(const DataState.loading());
    final result = await request();
    result.fold(
      (failure) => emit(DataState.error(failure.message)),
      (data) => emit(DataState.success(data)),
    );
  }
}
```

## 9. Pola Cubit turunan (presentation layer)

```dart
class XxxCubit extends BaseCubit<PaginationResult<XxxEntity>> {
  final XxxRepository _repository; // atau UseCase kalau dipakai
  XxxCubit(this._repository);

  void load() => fetchData(() => _repository.getXxxList());
}
```

**Checklist wajib:**
- [ ] Generic `BaseCubit<T>` HARUS pakai Entity (`PaginationResult<XxxEntity>`, bukan `PaginationResult<XxxModel>`)
- [ ] Tidak ada try-catch manual di Cubit — semua error handling sudah didorong ke `BaseCubit.fetchData`

---

## 10. Daftar Bug yang Pernah Ditemukan (jadi checklist audit)

Gunakan daftar ini sebagai checklist saat mengaudit tiap fitur:

1. ☐ Field di Model di-redeclare manual (bukan `super.xxx`) → shadowing bug
2. ☐ Entity/Model tidak override `props` lengkap (ada field yang lupa dimasukkan)
3. ☐ Typo nama class saat `extends` (misal `extends ExamStudentSum` padahal maksudnya `ExamStudentEntity`)
4. ☐ Model tidak `extends` Entity sama sekali (berdiri sendiri)
5. ☐ Ada dua class dengan nama sama di file berbeda (misal `NotificationModel` ada di 2 lokasi) → konflik tipe ambigu
6. ☐ `fromJson` pakai cast non-nullable (`as String`) padahal field Entity nullable → rawan crash
7. ☐ Nested object di `fromJson` tidak null-check sebelum parsing → crash kalau API kirim `null`
8. ☐ UseCase/Cubit/UI mengembalikan atau menerima Model, bukan Entity
9. ☐ Repository interface (domain) import dari `data/models/`
10. ☐ RepositoryImpl mendefinisikan abstract sendiri di data layer (harusnya implements dari domain)
11. ☐ DataSource dan Repository dicampur jadi satu class (tidak ada pemisahan layer sama sekali)
12. ☐ Beberapa fitur pakai UseCase layer, beberapa tidak, tanpa pola yang konsisten
13. ☐ Nama method antara DataSource, Repository interface, dan RepositoryImpl tidak konsisten/tidak cocok (menyebabkan error `implements` gagal)
14. ☐ Response sederhana (misal `ResponseCreateXxx` untuk create/update) tidak punya Entity pasangan padahal dipakai di layer domain

---

## 11. Instruksi Eksekusi untuk AI/Developer

1. **List semua fitur** di `lib/features/`.
2. **Untuk tiap fitur**, baca urutan file: `domain/entities` → `data/models` → `data/datasources` → `domain/repositories` → `data/repositories` → (`domain/usecases` kalau ada) → `presentation/cubit`.
3. **Cocokkan dengan checklist bug di poin 10** — catat semua penyimpangan sebelum mulai mengubah kode.
4. **Perbaiki dari layer domain dulu** (Entity → Repository interface), baru turun ke data layer (Model → DataSource → RepositoryImpl), baru presentation (UseCase → Cubit → UI). Ini supaya error compile yang muncul terurut dan mudah ditelusuri (top-down dependency).
5. **Setelah tiap fitur selesai**, jalankan `flutter analyze` untuk pastikan tidak ada type-mismatch tersisa sebelum lanjut ke fitur berikutnya.
6. **Jangan mengubah nama field/URL/endpoint API** — perbaikan ini murni soal struktur tipe (Model vs Entity) dan konsistensi layer, bukan soal logic bisnis atau kontrak API.
7. Kalau ditemukan Entity/Model yang benar-benar belum ada untuk suatu data (misal `ResponseCreateXxxEntity`), buat sesuai pola poin 2 & 3 di atas — field-nya ikuti struktur JSON asli endpoint terkait.
8. Untuk setiap fitur yang selesai diperbaiki, laporkan ringkas: file apa saja yang diubah dan bug mana dari checklist poin 10 yang ditemukan/diperbaiki.

---

## 12. Referensi Fitur yang Sudah Benar (jadikan acuan)

- `lib/features/classes/` — sudah dirapikan penuh (Entity, Model, DataSource, Repository interface & impl)
- `lib/features/exam/` — sudah dirapikan penuh, termasuk nested entity (`ExamStartEntity`, `ExamParticipantEntity`, dst)
- `lib/features/statistics/` — sudah dirapikan penuh, contoh kasus tanpa perlu `.map()` manual di RepositoryImpl karena inheritance sudah benar

Gunakan struktur di tiga fitur ini sebagai **template langsung** untuk menyamakan fitur lain (`notification`, `dailyTest`, `parents`, dan fitur lain yang belum diaudit).
