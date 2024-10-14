import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/models/project.dart';
import '../shared/theme.dart';

class CardProject extends StatelessWidget {
  final Project project;
  const CardProject({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.toNamed('/list-task', arguments: {'project_id': project.id}),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        padding: const EdgeInsets.all(9.0),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/image_product.png'),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  project.name!,
                  style: AppTextStyle.h3.copyWith(color: AppColors.white),
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined,
                        color: AppColors.white, size: 16),
                    const Gap(8),
                    Text(
                      '12 Juni 2023',
                      style: AppTextStyle.paragraphM
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              style: const ButtonStyle(),
              onPressed: () {},
              icon: Container(
                width: 43,
                height: 43,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: const Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
