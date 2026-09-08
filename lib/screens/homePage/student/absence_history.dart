import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:school_app/models/presence.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';
import 'package:school_app/widgets/cards/card_absence.dart';
import 'package:school_app/widgets/cards/card_activity.dart';

class AbsenceHistory extends StatelessWidget {
  const AbsenceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final presence = CountPresence(
      present: 12,
      permission: 2,
      sick: 1,
      absent: 0,
    );
    final records = List.generate(
      10,
      (index) => Presence(
        id: index + 1,
        status: index == 2 ? 'Izin' : 'Hadir',
        type: 'Kantor',
        createdAt: '2026-09-${index + 1}',
      ),
    );

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
          SizedBox(height: 200, child: UserAbsenceGrid(listPresence: records)),
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
}
