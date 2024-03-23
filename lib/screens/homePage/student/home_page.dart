import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<List<String>> event = [
    ['img_event_1.png', 'Acara Idul Adha', '12 Juni 2023'],
    ['img_event_2.png', 'Acara Idul Adha', '12 Juni 2023'],
    ['img_event_3.png', 'Acara Idul Adha', '12 Juni 2023'],
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 14, 24, 16),
            child: Row(
              children: [
                Image.asset('assets/icon_profile.png', width: 64),
                const Gap(28),
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
                const Spacer(),
                Image.asset('assets/icon_notification.png', width: 28),
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Kehadiran Hari Ini',
                      style: AppTextStyle.paragraphLBold),
                  Text(
                    'Rekap Absen',
                    style: AppTextStyle.paragraphM
                        .copyWith(color: AppColors.primary1),
                  )
                ],
              ),
            ),
            const Gap(14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * .44,
                  margin: const EdgeInsets.only(left: 18),
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: AppColors.black40),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            style: const ButtonStyle(),
                            onPressed: () {},
                            icon: Container(
                              width: 35,
                              height: 35,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: AppColors.info1.withOpacity(.1),
                              ),
                              child: Image.asset(
                                'assets/icon_login.png',
                                width: 24,
                              ),
                            ),
                          ),
                          Text('Masuk', style: AppTextStyle.paragraphM),
                        ],
                      ),
                      const Gap(8),
                      Text('07:00', style: AppTextStyle.h3),
                      const Gap(8),
                      Text('Tepat Waktu', style: AppTextStyle.paragraphM),
                    ],
                  ),
                ),
                Container(
                  width: width * .44,
                  margin: const EdgeInsets.only(right: 18),
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: AppColors.black40),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            style: const ButtonStyle(),
                            onPressed: () {},
                            icon: Container(
                              width: 35,
                              height: 35,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: AppColors.info1.withOpacity(.1),
                              ),
                              child: Image.asset(
                                'assets/icon_logout.png',
                                width: 24,
                              ),
                            ),
                          ),
                          Text('Keluar', style: AppTextStyle.paragraphM),
                        ],
                      ),
                      const Gap(8),
                      Text('15:20', style: AppTextStyle.h3),
                      const Gap(8),
                      Text('Pulang', style: AppTextStyle.paragraphM),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(12),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Event', style: AppTextStyle.paragraphLBold),
                  Text(
                    'Lihat Semua',
                    style: AppTextStyle.paragraphM
                        .copyWith(color: AppColors.primary1),
                  ),
                ],
              ),
            ),
            const Gap(10),
            CarouselSlider(
              options: CarouselOptions(height: 124.0),
              items: event.map((data) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.all(9.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/${data[0]}'),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Text(
                                'Acara Idul Adha',
                                style: AppTextStyle.h3
                                    .copyWith(color: AppColors.white),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined,
                                      color: AppColors.white, size: 16),
                                  const Gap(8),
                                  Text(
                                    '12 Juni 2023',
                                    style: AppTextStyle.paragraphM
                                        .copyWith(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            style: const ButtonStyle(),
                            onPressed: () {},
                            icon: Container(
                              width: 43,
                              height: 43,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child: const Icon(Icons.arrow_forward),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const Gap(18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * .44,
                    height: 174,
                    padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/spp_pattern.png'),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bayar SPP',
                          style:
                              AppTextStyle.h3.copyWith(color: AppColors.white),
                        ),
                        const Gap(2),
                        Text(
                          'Bayar SPP dengan mudah dan aman dengan berbagai metode pembayaran',
                          style: AppTextStyle.paragraphS
                              .copyWith(color: AppColors.white),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: const Size(160, 34),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              )),
                          child: Text(
                            'Bayar',
                            style: AppTextStyle.paragraphLBold.copyWith(
                              color: AppColors.secondary1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width * .44,
                    height: 174,
                    padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/absen_pattern.png'),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Izin Absen',
                          style:
                              AppTextStyle.h3.copyWith(color: AppColors.white),
                        ),
                        const Gap(2),
                        Text(
                          'Isi form untuk meminta izin absen',
                          style: AppTextStyle.paragraphS
                              .copyWith(color: AppColors.white),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: const Size(160, 34),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              )),
                          child: Text(
                            'Ajukan Izin',
                            style: AppTextStyle.paragraphLBold.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(17),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: PrimaryButtonWithIcon(
                titleButton: 'Tekan untuk Presensi Masuk',
                ontap: () {},
                icon: Icon(Icons.circle_outlined, color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
