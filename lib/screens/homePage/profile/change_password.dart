import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_textfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child:
                Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
          ),
          title: Text(
            'Ganti Password',
            style: AppTextStyle.h2.copyWith(color: AppColors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(AppMargin.defaultMargin),
          child: Column(
            children: [
              CustomTextFieldPassword(
                textController: passwordController,
                hintText: 'Masukkan Password Baru',
                titleTextField: 'Password',
              ),
              const Gap(15),
              CustomTextFieldPassword(
                textController: confirmPasswordController,
                hintText: 'Masukkan Ulang Password',
                titleTextField: 'Masukkan Ulang Password',
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
          child: PrimaryButton(
            titleButton: 'Perbarui',
            ontap: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
