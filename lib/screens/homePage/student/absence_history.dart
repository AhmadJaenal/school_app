import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:school_app/core/di/injection.dart';
import 'package:school_app/features/attendance/domain/entities/attendance.dart';
import 'package:school_app/features/attendance/domain/usecases/get_attendance.dart';
import 'package:school_app/models/presence.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';
import 'package:school_app/widgets/cards/card_absence.dart';
import 'package:school_app/widgets/cards/card_activity.dart';

class AbsenceHistory extends StatefulWidget {
  const AbsenceHistory({super.key});

  @override
  State<AbsenceHistory> createState() => _AbsenceHistoryState();
}

class _AbsenceHistoryState extends State<AbsenceHistory> {
  late final Future<List<Attendance>> _attendanceFuture;

  @override
  void initState() {
    super.initState();
    _attendanceFuture = sl<GetAttendance>().call();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Attendance>>(
      future: _attendanceFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Riwayat Absensi')),
            body: Center(
              child: Text('Gagal memuat absensi: ${snapshot.error}'),
            ),
          );
        }
        return _AttendanceContent(records: snapshot.data ?? const []);
      },
    );
  }
}

class _AttendanceContent extends StatelessWidget {
  const _AttendanceContent({required this.records});

  final List<Attendance> records;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final presence = CountPresence(
      present: records.where((item) => _status(item) == 'Hadir').length,
      permission: records.where((item) => _status(item) == 'Izin').length,
      sick: records.where((item) => _status(item) == 'Sakit').length,
      absent: records.where((item) => _status(item) == 'Alpa').length,
    );
    final presenceRecords = records
        .map(
          (item) => Presence(
            id: item.id,
            status: _status(item),
            type: 'Sekolah',
            createdAt: item.date,
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Riwayat Absensi', style: AppTextStyle.h2),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        children: [
          const SizedBox(height: 8),
          Row(
            children: [
              CardAbsence(
                width: width,
                title: 'Jumlah Hadir',
                color: AppColors.green,
                amount: presence.present ?? 0,
              ),
              const Spacer(),
              CardAbsence(
                width: width,
                title: 'Jumlah Izin',
                color: AppColors.info1,
                amount: presence.permission ?? 0,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              CardAbsence(
                width: width,
                title: 'Jumlah Sakit',
                color: AppColors.warning1,
                amount: presence.sick ?? 0,
              ),
              const Spacer(),
              CardAbsence(
                width: width,
                title: 'Jumlah Alpa',
                color: AppColors.danger1,
                amount: presence.absent ?? 0,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('Tracking Pengerjaan Tugas', style: AppTextStyle.paragraphLBold),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: UserAbsenceGrid(listPresence: presenceRecords),
          ),
          const SizedBox(height: 20),
          Text('Lokasi Terakhir', style: AppTextStyle.paragraphLBold),
          const SizedBox(height: 8),
          SizedBox(
            height: 172,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(-6.8865473, 107.6120931),
                  initialZoom: 9,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Aktivitas', style: AppTextStyle.paragraphLBold),
              TextButton(
                onPressed: () => context.push('/activity-student'),
                child: const Text('Lihat Semua'),
              ),
            ],
          ),
          const CardActivity(),
          const CardActivity(),
          const CardActivity(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static String _status(Attendance attendance) {
    switch (attendance.status.toLowerCase()) {
      case 'present':
      case 'hadir':
        return 'Hadir';
      case 'permission':
      case 'izin':
        return 'Izin';
      case 'sick':
      case 'sakit':
        return 'Sakit';
      default:
        return 'Alpa';
    }
  }
}
