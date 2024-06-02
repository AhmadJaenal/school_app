import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';

class PaymentSPP extends StatelessWidget {
  const PaymentSPP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Pembayaran',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
            margin: EdgeInsets.symmetric(
              horizontal: AppMargin.defaultMargin,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Informasi Siswa",
                  style: AppTextStyle.paragraphMBold.copyWith(
                    color: AppColors.black60,
                  ),
                ),
                const Gap(6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nama",
                      style: AppTextStyle.paragraphS.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      "Ahmad Jaenal Aripin",
                      style: AppTextStyle.paragraphSBold.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kelas",
                      style: AppTextStyle.paragraphS.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      "8-A",
                      style: AppTextStyle.paragraphSBold.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "NISN",
                      style: AppTextStyle.paragraphS.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      "11199245812",
                      style: AppTextStyle.paragraphSBold.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
            margin: EdgeInsets.symmetric(
              horizontal: AppMargin.defaultMargin,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rincian Pembayaran",
                  style: AppTextStyle.paragraphMBold.copyWith(
                    color: AppColors.black60,
                  ),
                ),
                const Gap(6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SPP",
                      style: AppTextStyle.paragraphMBold.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      "Rp750.000",
                      style: AppTextStyle.paragraphSBold.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Admin",
                      style: AppTextStyle.paragraphMBold.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      "Rp2500",
                      style: AppTextStyle.paragraphSBold.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
            margin: EdgeInsets.symmetric(
              horizontal: AppMargin.defaultMargin,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOTAL KESELURUHAN",
                      style: AppTextStyle.paragraphSBold.copyWith(
                        color: AppColors.primary1,
                      ),
                    ),
                    Text(
                      "Rp752.500/-",
                      style: AppTextStyle.paragraphMBold.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: PrimaryButton(
            titleButton: 'Bayar',
            ontap: () {
              Get.toNamed('/invoice');
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
