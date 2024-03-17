import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(99),
            Image.asset('assets/logo.png', width: 80),
            const Gap(20),
            RichText(
              text: TextSpan(
                style: AppTextStyle.h1.copyWith(color: AppColors.black),
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Selamat Datang👋\ndi ',
                  ),
                  TextSpan(
                    text: 'Labschool App.',
                    style: AppTextStyle.h1.copyWith(color: AppColors.primary1),
                  ),
                ],
              ),
            ),
            const Gap(5),
            Text(
              "Halo, silakan masuk untuk melanjutkan",
              style: AppTextStyle.paragraphM.copyWith(color: AppColors.black80),
            ),
            const Gap(20),
            TextField(
              style: AppTextStyle.paragraphL.copyWith(
                  color: AppColors.black, fontWeight: AppWeightFont.bold),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.secondary1, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Your Email",
                hintStyle: AppTextStyle.paragraphL.copyWith(
                  color: AppColors.black80,
                  fontWeight: AppWeightFont.bold,
                ),
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
