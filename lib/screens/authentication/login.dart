import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final formKey = GlobalKey<FormState>();
TextEditingController _emailC = TextEditingController();
TextEditingController _passwordC = TextEditingController();
@override
void dispose() {
  _emailC.dispose();
  _passwordC.dispose();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Form(
          key: formKey,
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
                      style:
                          AppTextStyle.h1.copyWith(color: AppColors.primary1),
                    ),
                  ],
                ),
              ),
              const Gap(5),
              Text(
                "Halo, silakan masuk untuk melanjutkan",
                style:
                    AppTextStyle.paragraphM.copyWith(color: AppColors.black80),
              ),
              const Gap(10),
              CustomTextField(
                hintText: "Masukan email",
                titleTextField: 'Email',
                textController: _emailC,
              ),
              CustomTextFieldPassword(
                  titleTextField: 'Password',
                  textController: _passwordC,
                  hintText: 'Masukan password'),
              const Gap(10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Get.toNamed('/forgot-password'),
                  child: Text(
                    "Lupa Password ?",
                    style: AppTextStyle.paragraphM
                        .copyWith(color: AppColors.secondary1),
                  ),
                ),
              ),
              const Gap(30),
              PrimaryButton(
                  titleButton: "Masuk",
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      print('validasi berhasil');
                    } else {
                      print('validasi gagal');
                    }
                  }),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/register');
                  },
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyle.paragraphM
                          .copyWith(color: AppColors.black),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Belum punya akun? ',
                        ),
                        TextSpan(
                          text: 'Daftar',
                          style: AppTextStyle.paragraphM
                              .copyWith(color: AppColors.secondary1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
