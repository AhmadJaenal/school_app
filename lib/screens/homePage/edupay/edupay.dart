import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';

class Edupay extends StatelessWidget {
  const Edupay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'EduPay',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 113,
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.secondary1,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/pattern_edupay.png'),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saldo EduPay',
                        style: AppTextStyle.h3.copyWith(color: AppColors.white),
                      ),
                      Text(
                        'Rp1.200.000',
                        style: AppTextStyle.h2.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130,
                        height: 32,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            minimumSize: const Size(double.infinity, 56),
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(Icons.file_download_outlined,
                              color: AppColors.secondary1),
                          label: Text(
                            'Tabungkan',
                            style: AppTextStyle.paragraphSBold.copyWith(
                              color: AppColors.secondary1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 32,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            minimumSize: const Size(double.infinity, 56),
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(Icons.add_circle_outline_outlined,
                              color: AppColors.secondary1),
                          label: Text(
                            'Top-Up',
                            style: AppTextStyle.paragraphSBold.copyWith(
                              color: AppColors.secondary1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(17),
            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.black40,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tabungan',
                        style: AppTextStyle.paragraphMBold
                            .copyWith(color: AppColors.black100),
                      ),
                      Text(
                        'Rp500.000',
                        style:
                            AppTextStyle.h2.copyWith(color: AppColors.black100),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tarik Uang',
                        style: AppTextStyle.paragraphXS
                            .copyWith(color: AppColors.black100),
                      ),
                      SizedBox(
                        width: 130,
                        height: 32,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.primary1,
                            minimumSize: const Size(double.infinity, 56),
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(Icons.file_upload_outlined,
                              color: AppColors.white),
                          label: Text(
                            'Ambil Tabungan',
                            style: AppTextStyle.paragraphSBold.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(17),
            Text(
              'Pembayaran Tagihan',
              style: AppTextStyle.h3.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
