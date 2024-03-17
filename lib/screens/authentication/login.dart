import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_textfield.dart';

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
            const CustomTextField(hintText: "Your Email"),
            const Gap(16),
            const CustomTextFieldPassword(),
            const Gap(10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Lupa Password ?",
                style: AppTextStyle.paragraphM
                    .copyWith(color: AppColors.secondary1),
              ),
            ),
            const Gap(30),
            PrimaryButton(titleButton: "Masuk", ontap: () {}),
          ],
        ),
      ),
      floatingActionButton: RichText(
        text: TextSpan(
          style: AppTextStyle.paragraphM.copyWith(color: AppColors.black),
          children: <TextSpan>[
            const TextSpan(
              text: 'Belum punya akun? ',
            ),
            TextSpan(
              text: 'Daftar',
              style:
                  AppTextStyle.paragraphM.copyWith(color: AppColors.secondary1),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
