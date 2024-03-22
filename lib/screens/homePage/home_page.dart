import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          ],
        ),
      ),
    );
  }
}
