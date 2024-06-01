import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/transaction_widget.dart';

class BillPage extends StatelessWidget {
  const BillPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Tagihan SPP',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(24),
            Text(
              'Informasi  Siswa',
              style: AppTextStyle.paragraphMBold.copyWith(
                color: AppColors.black60,
              ),
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nama',
                  style: AppTextStyle.paragraphL.copyWith(
                    color: AppColors.black100,
                  ),
                ),
                Text(
                  'Ahmad Jaenal Aripin',
                  style: AppTextStyle.paragraphLBold.copyWith(
                    color: AppColors.black100,
                  ),
                ),
              ],
            ),
            const Gap(14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kelas',
                  style: AppTextStyle.paragraphL.copyWith(
                    color: AppColors.black100,
                  ),
                ),
                Text(
                  '8-A',
                  style: AppTextStyle.paragraphLBold.copyWith(
                    color: AppColors.black100,
                  ),
                ),
              ],
            ),
            const Gap(14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'NISN',
                  style: AppTextStyle.paragraphL.copyWith(
                    color: AppColors.black100,
                  ),
                ),
                Text(
                  '11199245812',
                  style: AppTextStyle.paragraphLBold.copyWith(
                    color: AppColors.black100,
                  ),
                ),
              ],
            ),
            const Gap(32),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.black100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tagihan Bulan ini',
                    style: AppTextStyle.h2.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const Gap(10),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.paragraphS
                          .copyWith(color: AppColors.white),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Jatuh Tempo ',
                        ),
                        TextSpan(
                          text: '10 Okt',
                          style: AppTextStyle.paragraphSBold
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp750.000',
                        style: AppTextStyle.h2.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 50,
                        child: PrimaryButton(
                            titleButton: 'Bayar',
                            ontap: () {
                              Get.toNamed('/payment-spp');
                            }),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Gap(32),
            Text(
              'Riwayat Pembayaran SPP',
              style: AppTextStyle.paragraphLBold.copyWith(
                color: AppColors.black100,
              ),
            ),
            const Gap(10),
            SizedBox(
              height: height * .4,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => const TransactionSPPWidget(
                  amount: '750.000',
                  date: '26 Mei 2023',
                  codeTransaction: 'PMA002934',
                  nameBank: 'Bank BCA',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
