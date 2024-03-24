import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';

class ListChildren extends StatelessWidget {
  const ListChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Anak',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CardDataChildren(),
          CardDataChildren(),
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary1,
          minimumSize: const Size(62, 62),
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
        ),
        onPressed: () {
          Get.toNamed('/add-children');
        },
        child: Icon(
          Icons.add,
          color: AppColors.white,
          size: 32,
          weight: 2,
        ),
      ),
    );
  }

  Padding CardDataChildren() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
      child: Row(
        children: [
          Container(
            width: 61,
            height: 61,
            padding: const EdgeInsets.all(17),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary1,
            ),
            child: Image.asset('assets/icon_student.png'),
          ),
          const Gap(16),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Nama siswa\n',
                  style:
                      AppTextStyle.paragraphL.copyWith(color: AppColors.black),
                ),
                TextSpan(
                  text: '32732192031',
                  style:
                      AppTextStyle.paragraphL.copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            'Kelas 8A',
            style: AppTextStyle.paragraphM.copyWith(color: AppColors.black),
          )
        ],
      ),
    );
  }
}
