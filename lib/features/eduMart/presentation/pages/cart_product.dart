import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/style/style.dart';
import '../../../onBoarding/presentation/widgets/custom_button.dart';
import '../widgets/card_cart_product.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({super.key});

  @override
  State<CartProduct> createState() => _CartProductState();
}

bool _switchValue = true;

class _CartProductState extends State<CartProduct> {
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
            onTap: () => Get.toNamed('/history-edumart'),
            child: Padding(
              padding: EdgeInsets.only(right: AppMargin.defaultMargin),
              child: Icon(Icons.history, color: AppColors.black100),
            ),
          ),
        ],
        title: Text(
          'Keranjang',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) => cartProduct(),
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        height: 140,
        color: AppColors.white,
        padding: EdgeInsets.symmetric(
          horizontal: AppMargin.defaultMargin,
          vertical: 12,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icon_coin.png',
                  width: 24,
                  color: AppColors.warning2,
                ),
                const Gap(4),
                Text(
                  "Tukarkan 1000 poin",
                  style: AppTextStyle.paragraphL
                      .copyWith(color: AppColors.black100),
                ),
                const Gap(4),
                Icon(Icons.help_outline_rounded, color: AppColors.black60),
                const Spacer(),
                Switch(
                  activeColor: AppColors.white,
                  activeTrackColor: AppColors.primary1,
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: AppTextStyle.paragraphM
                        .copyWith(color: AppColors.black),
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Total\n',
                      ),
                      TextSpan(
                        text: 'Rp72.000',
                        style: AppTextStyle.h3.copyWith(color: AppColors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: PrimaryButton(
                    titleButton: 'Checkout',
                    ontap: () {
                      Get.offAllNamed('/invoice');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
