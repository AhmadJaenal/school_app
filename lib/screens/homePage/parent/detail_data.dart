import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/card_absence.dart';

class DetailData extends StatelessWidget {
  const DetailData({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
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
          ],
        ),
      ),
    );
  }
}
