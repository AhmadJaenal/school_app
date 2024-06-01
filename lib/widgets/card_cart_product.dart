import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kopi Gojo',
                    style: AppTextStyle.paragraphLBold
                        .copyWith(color: AppColors.black100),
                  ),
                  const Gap(4),
                  Text(
                    'Makanan',
                    style: AppTextStyle.paragraphS
                        .copyWith(color: AppColors.black80),
                  ),
                  const Gap(2),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.black80, width: 1),
                    ),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.minus,
                            color: AppColors.black80, size: 16),
                        const Gap(4),
                        Text(
                          '1',
                          style: AppTextStyle.paragraphM.copyWith(
                            color: AppColors.black100,
                          ),
                        ),
                        const Gap(4),
                        Icon(Icons.add, color: AppColors.black80, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
}
