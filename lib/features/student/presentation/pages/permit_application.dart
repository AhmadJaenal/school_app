import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../core/style/style.dart';
import '../../../auth/presentation/widgets/custom_textfield.dart';
import '../../../onBoarding/presentation/widgets/custom_button.dart';

class PermitApplication extends StatelessWidget {
  PermitApplication({super.key});

  final List<String> _optionAbsence = [
    'Pilih',
    'Izin',
    'Sakit',
  ];

  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Form Izin',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown(
              titleTextField: 'Jenis Izin',
              option: _optionAbsence,
            ),
            const Gap(15),
            Text(
              'Deskripsi',
              style: AppTextStyle.paragraphM.copyWith(
                color: AppColors.black100,
              ),
            ),
            const Gap(6),
            CustomTextArea(
              hintText: 'Contoh: Ada urusan keluarga',
              textController: _descController,
            ),
            Text(
              'Foto Bukti',
              style: AppTextStyle.paragraphM.copyWith(
                color: AppColors.black100,
              ),
            ),
            const Gap(6),
            GestureDetector(
              onTap: () {
                Get.toNamed('/camera');
              },
              child: Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.black60,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 45,
                      color: AppColors.black80,
                    ),
                    Text(
                      'Ambil Gambar',
                      style: AppTextStyle.h3.copyWith(
                        color: AppColors.black80,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(15),
            PrimaryButton(titleButton: 'Kirim', ontap: () {}),
          ],
        ),
      ),
    );
  }
}
