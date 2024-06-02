import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';

Widget cartProduct() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(
      horizontal: AppMargin.defaultMargin,
      vertical: 16,
    ),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.black60,
          width: 1,
        ),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(CupertinoIcons.bag, color: AppColors.primary1),
            const Gap(6),
            Text(
              'EduMart 1',
              style: AppTextStyle.paragraphLBold
                  .copyWith(color: AppColors.black100),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: AppColors.black60,
              ),
            )
          ],
        ),
        const Gap(12),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/image_product.png',
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(16),
            RichText(
              text: TextSpan(
                style: AppTextStyle.paragraphL.copyWith(color: AppColors.black),
                children: [
                  const TextSpan(
                    text: 'Kopi Gojo\n',
                  ),
                  TextSpan(
                    text: 'Makanan\n',
                    style: AppTextStyle.paragraphS
                        .copyWith(color: AppColors.black),
                  ),
                  WidgetSpan(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.black80, width: 1),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.minus,
                              color: AppColors.black80, size: 16),
                          const Gap(8),
                          Text(
                            '1',
                            style: AppTextStyle.paragraphM.copyWith(
                              color: AppColors.black100,
                            ),
                          ),
                          const Gap(8),
                          Icon(Icons.add, color: AppColors.black80, size: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Icon(
                  Icons.close,
                  color: AppColors.black100,
                ),
                const Gap(24),
                Text(
                  'Rp24.000',
                  style: AppTextStyle.paragraphSBold.copyWith(
                    color: AppColors.secondary1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
