import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/card_absence.dart';
import 'package:school_app/widgets/card_activity.dart';

class DetailData extends StatelessWidget {
  const DetailData({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Detail Anak',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset('assets/icon_profile.png', width: 64),
                const Gap(16),
                RichText(
                  text: TextSpan(
                    style: AppTextStyle.h3.copyWith(color: AppColors.black),
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Budi Septian\n',
                      ),
                      TextSpan(
                        text: 'Kelas 8A',
                        style: AppTextStyle.paragraphL
                            .copyWith(color: AppColors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardAbsence(
                  width: width,
                  title: 'Jumlah Izin',
                  color: AppColors.info1,
                  amount: 0,
                ),
                CardAbsence(
                  width: width,
                  title: 'Jumlah Hadir',
                  color: AppColors.green,
                  amount: 3,
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
                  color: AppColors.secondary1,
                  amount: 1,
                ),
                CardAbsence(
                  width: width,
                  title: 'Jumlah Alpa',
                  color: AppColors.danger2,
                  amount: 1,
                ),
              ],
            ),
            const Gap(11),
            Text('Lokasi Terakhir', style: AppTextStyle.paragraphLBold),
            const Gap(10),
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
            const Gap(11),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Aktivitas', style: AppTextStyle.paragraphLBold),
                GestureDetector(
                  onTap: () => context.push('/activity-student'),
                  child: Text(
                    'Lihat Semua',
                    style: AppTextStyle.paragraphM
                        .copyWith(color: AppColors.primary1),
                  ),
                ),
              ],
            ),
            const Gap(11),
            Container(
              height: 200,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => const CardActivity(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
