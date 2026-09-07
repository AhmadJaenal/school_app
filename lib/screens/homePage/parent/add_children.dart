import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_textfield.dart';

class AddChildren extends StatelessWidget {
  AddChildren({super.key});
  final TextEditingController _nisnC = TextEditingController();

  @override
  void dispose() {
    _nisnC.dispose();
  }

  void _clearTextControllers() {
    _nisnC.clear();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        actions: [
          GestureDetector(
              onTap: () => context.push('/notification'),
              child: Padding(
                padding: EdgeInsets.only(right: AppMargin.defaultMargin),
                child: Image.asset('assets/icon_notification.png', width: 28),
              )),
        ],
        title: Text(
          'Anak',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/img_add_children.png',
                width: width * .8,
              ),
            ),
            const Gap(24),
            Text('Tambahkan anak', style: AppTextStyle.h1),
            const Gap(10),
            Text(
              'Masukkan NISN anak anda untuk\nmenambahkan anak anda pada sistem',
              style: AppTextStyle.paragraphL.copyWith(
                color: AppColors.black60,
              ),
              textAlign: TextAlign.center,
            ),
            CustomTextField(
                hintText: 'NIS anak',
                titleTextField: '',
                textController: _nisnC),
            const Gap(25),
            PrimaryButton(titleButton: 'Tambah Anak', ontap: () {})
          ],
        ),
      ),
    );
  }
}
