import 'dart:convert';
import 'dart:developer' as dev;

import 'package:http/http.dart' as http;
import 'package:school_app/api/urls.dart';
import 'package:school_app/models/classroom.dart';

class ClassroomController {
  final http.Client client;

  ClassroomController({http.Client? client}) : client = client ?? http.Client();

  Future<List<Classroom>> fetchClassrooms() async {
    final response =
        await client.get(Uri.parse('${URLs.baseURL}${URLs.classrooms}'));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List<dynamic> data = jsonBody['data'];
      return data.map((e) => Classroom.fromJson(e)).toList();
    } else {
      dev.log('status code: ${response.statusCode}');
      throw Exception('Failed to load classrooms');
    }
  }

  Future<Classroom> fetchClassroomById(int id) async {
    final response =
        await client.get(Uri.parse('${URLs.baseURL}${URLs.classroomById}$id'));

    dev.log('status code: ${response.statusCode}');
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final data = jsonBody['data'];
      return Classroom.fromJson(data);
    } else {
      dev.log('status code: ${response.statusCode}');
      throw Exception('Failed to load classroom');
    }
  }

  double hitungLuasPersegiPanjang(double panjang, double lebar) {
    return panjang * lebar;
  }

  Map<String, dynamic> prosesPendaftaranMahasiswa(
      String nama, String email, int umur, String jurusan) {
    final jurusanValid = ['Informatika', 'Sistem Informasi', 'Teknik Elektro'];

    if (nama.trim().isEmpty) {
      return {
        'isValid': false,
        'pesan': 'Nama tidak boleh kosong',
      };
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return {
        'isValid': false,
        'pesan': 'Format email tidak valid',
      };
    }

    if (umur < 17) {
      return {
        'isValid': false,
        'pesan': 'Umur minimal adalah 17 tahun',
      };
    }

    if (!jurusanValid.contains(jurusan)) {
      return {
        'isValid': false,
        'pesan':
            'Jurusan tidak dikenali. Pilih salah satu dari: ${jurusanValid.join(', ')}',
      };
    }

    // Tentukan rekomendasi program
    String rekomendasi = '';
    if (jurusan == 'Informatika') {
      rekomendasi = 'Direkomendasikan program Flutter & AI';
    } else if (jurusan == 'Sistem Informasi') {
      rekomendasi = 'Cocok untuk Business Intelligence & Data Analytics';
    } else if (jurusan == 'Teknik Elektro') {
      rekomendasi = 'Rekomendasi: IoT & Embedded Systems';
    }

    return {
      'isValid': true,
      'pesan': 'Pendaftaran berhasil!',
      'rekomendasi': rekomendasi,
    };
  }
}
