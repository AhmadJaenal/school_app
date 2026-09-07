import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';

class InvoiceSPP extends StatelessWidget {
  const InvoiceSPP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary1,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.white),
        ),
        title: Text(
          'Invoice',
          style: AppTextStyle.h2.copyWith(color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppMargin.defaultMargin),
            color: AppColors.primary1,
            child: Column(
              children: [
                Text(
                  'No.ASD29213043',
                  style: AppTextStyle.paragraphL.copyWith(
                    color: AppColors.primary4,
                  ),
                ),
                const Gap(14),
                Text(
                  'Rp750.000',
                  style: AppTextStyle.h1.copyWith(
                    color: AppColors.black10,
                  ),
                ),
                const Gap(14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tanggal',
                      style: AppTextStyle.paragraphLBold.copyWith(
                        color: AppColors.black10,
                      ),
                    ),
                    const Gap(14),
                    Text(
                      '20.Okt.2023',
                      style: AppTextStyle.paragraphL.copyWith(
                        color: AppColors.black10,
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
                  "Informasi  Pengguna",
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
                      "No Telp",
                      style: AppTextStyle.paragraphS.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      "0882123123",
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
                      "Email",
                      style: AppTextStyle.paragraphS.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      "ubud@gmail.com",
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
                      "Channel",
                      style: AppTextStyle.paragraphS.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      "Bank BCA",
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
                  "Item",
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
                Text(
                  "1x Rp750.000",
                  style: AppTextStyle.paragraphSBold.copyWith(
                    color: AppColors.black80,
                  ),
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
                      "Subtotal",
                      style: AppTextStyle.paragraphMBold.copyWith(
                        color: AppColors.black60,
                      ),
                    ),
                    Text(
                      "Rp750.000",
                      style: AppTextStyle.paragraphXSBold.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Diskon",
                      style: AppTextStyle.paragraphMBold.copyWith(
                        color: AppColors.black60,
                      ),
                    ),
                    Text(
                      "-Rp0",
                      style: AppTextStyle.paragraphXSBold.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Admin",
                      style: AppTextStyle.paragraphMBold.copyWith(
                        color: AppColors.black60,
                      ),
                    ),
                    Text(
                      "Rp2500",
                      style: AppTextStyle.paragraphXSBold.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GRAND TOTAL",
                      style: AppTextStyle.paragraphMBold.copyWith(
                        color: AppColors.primary1,
                      ),
                    ),
                    Text(
                      "Rp752.500",
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
            titleButton: 'Menu',
            ontap: () {
              context.go('/nav');
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
