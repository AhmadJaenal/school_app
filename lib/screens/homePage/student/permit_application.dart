import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';

class PermitApplication extends StatelessWidget {
  const PermitApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Riwayat Absensi',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
    );
  }
}
