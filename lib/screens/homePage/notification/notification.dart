import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';

// ignore: must_be_immutable
class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  List<List<String>> notification = [
    ['Izin diterima', 'Permohonan izin diterima oleh sekolah.', '15:29'],
    [
      'Pembayaran SPP',
      'Segera lakukan pembayaran SPP sebelum tanggal 19 September 2023',
      '18:29',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Notifikasi',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: notification.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppMargin.defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification[index][0],
                    style: AppTextStyle.paragraphLBold,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * .7,
                        child: Text(
                          notification[index][1],
                          style: AppTextStyle.paragraphS,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        notification[index][2],
                        style: AppTextStyle.paragraphS,
                      ),
                    ],
                  ),
                  const Gap(24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
