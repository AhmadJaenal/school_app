import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/routing/app_routes.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';
import 'package:school_app/widgets/buttons/custom_button.dart';
import 'package:school_app/widgets/forms/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nisnController = TextEditingController(
    text: '11199245812',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: 'password',
  );

  @override
  void dispose() {
    _nisnController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
              RichText(
                text: TextSpan(
                  style: AppTextStyle.h1.copyWith(color: AppColors.black),
                  children: [
                    const TextSpan(text: 'Selamat Datang👋\ndi '),
                    WidgetSpan(
                      child: Image.asset(
                        'assets/logo_cyberlabs.png', // Path gambar di folder assets
                        width: 180,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(5),
              Text(
                "Halo, silakan masuk untuk melanjutkan",
                style: AppTextStyle.paragraphM.copyWith(
                  color: AppColors.black80,
                ),
              ),
              const Gap(10),
              CustomTextField(
                hintText: "Masukan NISN",
                titleTextField: 'NISN',
                textController: _nisnController,
              ),
              CustomTextFieldPassword(
                titleTextField: 'Password',
                textController: _passwordController,
                hintText: 'Masukan password',
              ),
              const Gap(10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => {},
                  child: Text(
                    "Lupa Password ?",
                    style: AppTextStyle.paragraphM.copyWith(
                      color: AppColors.primary1,
                    ),
                  ),
                ),
              ),
              const Gap(30),
              PrimaryButton(
                titleButton: "Masuk",
                ontap: () {
                  if (formKey.currentState!.validate()) {
                    context.go(Routes.nav);
                  }
                },
              ),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyle.paragraphM.copyWith(
                        color: AppColors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: 'Belum punya akun? '),
                        TextSpan(
                          text: 'Daftar',
                          style: AppTextStyle.paragraphM.copyWith(
                            color: AppColors.primary1,
                          ),
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
