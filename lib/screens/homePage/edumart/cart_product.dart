import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child:
              Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black100),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: AppMargin.defaultMargin),
              child: Icon(Icons.history, color: AppColors.black100),
            ),
          ),
        ],
        title: Text(
          'Detail Produk',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
