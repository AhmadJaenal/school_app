import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/shared/theme.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Profil Lengkap',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppMargin.defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserData(title: 'NIP', data: '1192383012'),
            UserData(title: 'Nama Lengkap', data: 'Galur Pradana'),
            UserData(title: 'Email', data: 'galuh@yahoo.com'),
            UserData(title: 'Alamat', data: 'Gg. Perintis Kemerdekaan No. 539'),
            UserData(title: 'No Telp', data: '0942 9355 848'),
            UserData(title: 'Agama', data: 'Islam'),
            UserData(title: 'Posisi', data: 'Sekretaris'),
          ],
        ),
      ),
    );
  }

  Column UserData({required String title, required String data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.paragraphMBold.copyWith(color: AppColors.black60),
        ),
        const Gap(3),
        Text(
          data,
          style: AppTextStyle.paragraphL.copyWith(
            color: AppColors.black100,
          ),
        ),
        const Gap(10),
      ],
    );
  }
}
