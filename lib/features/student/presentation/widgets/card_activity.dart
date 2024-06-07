import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/style/style.dart';

class CardActivity extends StatelessWidget {
  const CardActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.info1.withOpacity(.1),
            ),
            child: Image.asset(
              'assets/icon_login.png',
            ),
          ),
          const Gap(16),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Masuk\n',
                  style: AppTextStyle.paragraphLBold
                      .copyWith(color: AppColors.black),
                ),
                TextSpan(
                  text: '23 Agustus 2023',
                  style: AppTextStyle.paragraphM
                      .copyWith(color: AppColors.black80),
                ),
              ],
            ),
          ),
          const Spacer(),
          RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '07:01\n',
                  style: AppTextStyle.paragraphLBold
                      .copyWith(color: AppColors.black),
                ),
                TextSpan(
                  text: 'Tepat Waktu',
                  style: AppTextStyle.paragraphM
                      .copyWith(color: AppColors.black80),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
