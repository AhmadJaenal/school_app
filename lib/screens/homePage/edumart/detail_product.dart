import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child:
              Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black100),
        ),
        actions: [
          GestureDetector(
            onTap: () => context.push('/edumart/cart'),
            child: Padding(
              padding: EdgeInsets.only(right: AppMargin.defaultMargin),
              child:
                  Icon(Icons.shopping_cart_outlined, color: AppColors.black100),
            ),
          ),
        ],
        title: Text(
          'Detail Produk',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/image_product.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(12),
            Text(
              'Kopi Gayo 200gr',
              style: AppTextStyle.h2.copyWith(color: AppColors.black100),
            ),
            Text(
              'ABE',
              style: AppTextStyle.paragraphMBold
                  .copyWith(color: AppColors.black60),
            ),
            Text(
              'Rp 72.000',
              style: AppTextStyle.h3.copyWith(color: AppColors.black100),
            ),
            const Gap(5),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.black100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Makanan',
                    style: AppTextStyle.paragraphXS.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: 18,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: AppColors.black40,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Text(
                  'Stok 19',
                  style: AppTextStyle.paragraphMBold.copyWith(
                    color: AppColors.black80,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(color: AppColors.black60),
            ),
            Text(
              'Deskripsi',
              style: AppTextStyle.paragraphLBold.copyWith(
                color: AppColors.black100,
              ),
            ),
            const Gap(5),
            Text(
              'produk ini merupakan minuman dengan  aroma jeruk dan rasa yang manis',
              style: AppTextStyle.paragraphL.copyWith(
                color: AppColors.black100,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: PrimaryButton(
          ontap: () {},
          titleButton: 'Masukan ke Keranjang',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
