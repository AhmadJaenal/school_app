import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/card_activity.dart';

class ActivityStudent extends StatelessWidget {
  ActivityStudent({super.key});

  List<List<String>> notification = [
    ['Izin diterima', 'Permohonan izin diterima oleh sekolah.', '15:29'],
    [
      'Pembayaran SPP',
      'Segera lakukan pembayaran SPP sebelum tanggal 19 September 2023',
      '18:29'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Aktivitas',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: notification.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
              child: const CardActivity(),
            );
          },
        ),
      ),
    );
  }
}
