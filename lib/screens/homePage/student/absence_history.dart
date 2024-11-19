import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../../../datasource/local_datasource.dart';
import '../../../models/presence.dart';
import '../../../services/presence_service.dart';
import '../../../shared/theme.dart';
import '../../../widgets/card_absence.dart';
import '../../../widgets/card_activity.dart';

// ignore: must_be_immutable
class AbsenceHistory extends StatelessWidget {
  const AbsenceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    PresenceProvider presenceProvider = Provider.of<PresenceProvider>(context);
    UserPreferences userPrefs = UserPreferences();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Riwayat Absensi',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: ListView(
          children: [
            const Gap(8),
            FutureBuilder(
              future: UserPreferences().getPresence(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData) {
                  CountPresence countPresence = snapshot.data!;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardAbsence(
                            width: width,
                            title: 'Jumlah Hadir',
                            color: AppColors.green,
                            amount: countPresence.present ?? 0,
                          ),
                          CardAbsence(
                            width: width,
                            title: 'Jumlah Izin',
                            color: AppColors.info1,
                            amount: countPresence.permission ?? 0,
                          ),
                        ],
                      ),
                      const Gap(14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardAbsence(
                            width: width,
                            title: 'Jumlah Sakit',
                            color: AppColors.warning1,
                            amount: countPresence.sick ?? 0,
                          ),
                          CardAbsence(
                            width: width,
                            title: 'Jumlah Alpa',
                            color: AppColors.danger1,
                            amount: countPresence.absent ?? 0,
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const Text('Loading');
                }
              },
            ),
            const Gap(16),
            Text(
              'Tracking Pengerjaan Tugas',
              style:
                  AppTextStyle.paragraphLBold.copyWith(color: AppColors.black),
            ),
            const Gap(8),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: FutureBuilder(
                future: presenceProvider.getPresenceByUserId(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data!['status']) {
                    List<Presence> listPresence = snapshot.data!['data'];
                    return UserAbsenceGrid(listPresence: listPresence);
                  }
                  return Center(
                      child: Text('Siswa belum pernah melakukan absensi',
                          style: AppTextStyle.paragraphM
                              .copyWith(color: AppColors.black80)));
                },
              ),
            ),
            const Gap(16),
            FutureBuilder(
              future: userPrefs.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data!.roles!.contains('staff')) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lokasi Terakhir',
                          style: AppTextStyle.paragraphLBold),
                      const Gap(8),
                      SizedBox(
                        width: double.infinity,
                        height: 172,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: FlutterMap(
                            options: const MapOptions(
                              initialCenter: LatLng(-6.8865473, 107.6120931),
                              minZoom: 9,
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
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Aktivitas', style: AppTextStyle.paragraphLBold),
                GestureDetector(
                  onTap: () => Get.toNamed('/activity-student'),
                  child: Text(
                    'Lihat Semua',
                    style: AppTextStyle.paragraphM
                        .copyWith(color: AppColors.primary1),
                  ),
                )
              ],
            ),
            const Gap(15),
            const CardActivity(),
            const CardActivity(),
            const CardActivity(),
            const CardActivity(),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
