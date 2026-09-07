import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isEmailSelected = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 24),
          icon: const Icon(Icons.keyboard_arrow_left_rounded, size: 26),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Text(
              "Lupa password 🤔",
              style: AppTextStyle.h1,
            ),
            const Gap(5),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "Pilih informasi kontak mana yang ingin Anda gunakan untuk mereset kata sandi Anda.",
                style: AppTextStyle.paragraphSecondaryS
                    .copyWith(color: AppColors.black60),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/image_forgot_pass.png',
                width: width * .7,
              ),
            ),
            const Gap(50),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isEmailSelected = !_isEmailSelected;
                });
              },
              child: Container(
                width: double.infinity,
                height: 62,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white,
                  border: Border.all(
                    color:
                        _isEmailSelected ? AppColors.blue : AppColors.black40,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: _isEmailSelected
                          ? AppColors.blue.withOpacity(.7)
                          : AppColors.black40,
                      offset: const Offset(0, 0),
                      spreadRadius: .2,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_open_outlined,
                        color: _isEmailSelected
                            ? AppColors.primary1
                            : AppColors
                                .black60), // Warna icon sesuai dengan kondisi _isEmailSelected
                    const Gap(8),
                    RichText(
                      text: TextSpan(
                        style: AppTextStyle.paragraphMBold
                            .copyWith(color: AppColors.black),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Email\n',
                          ),
                          TextSpan(
                            text: 'username.email.com',
                            style: AppTextStyle.paragraphS
                                .copyWith(color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    _isEmailSelected
                        ? Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary1),
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white),
                            ),
                          )
                        : Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.black60,
                                width: 1.5,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            const Gap(16),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isEmailSelected = !_isEmailSelected;
                });
              },
              child: Container(
                width: double.infinity,
                height: 62,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white,
                  border: Border.all(
                    color:
                        _isEmailSelected ? AppColors.black40 : AppColors.blue,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: _isEmailSelected
                          ? AppColors.black40
                          : AppColors.blue.withOpacity(.7),
                      offset: const Offset(0, 0),
                      spreadRadius: .2,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.phone,
                        color: _isEmailSelected
                            ? AppColors.black60
                            : AppColors.primary1),
                    const Gap(8),
                    RichText(
                      text: TextSpan(
                        style: AppTextStyle.paragraphMBold
                            .copyWith(color: AppColors.black),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Whatsapp\n',
                          ),
                          TextSpan(
                            text: '0896562873',
                            style: AppTextStyle.paragraphS
                                .copyWith(color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    _isEmailSelected
                        ? Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.black60,
                                width: 1.5,
                              ),
                            ),
                          )
                        : Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary1),
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: PrimaryButton(
          ontap: () {},
          titleButton: 'Kirim',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
