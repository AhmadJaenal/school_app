import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';

class ListEvent extends StatelessWidget {
  ListEvent({super.key});

  List<List<String>> event = [
    ['img_event_1.png', 'Acara Kelulusan', '12 Juni 2023'],
    ['img_event_2.png', 'Acara Musik', '13 Juni 2023'],
    ['img_event_3.png', 'Acara Idul Adha', '14 Juni 2023'],
  ];

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
          'Semua Event',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: event.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 124,
              margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
              padding: const EdgeInsets.all(9.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/${event[index][0]}'),
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
                        event[index][1],
                        style: AppTextStyle.h3.copyWith(color: AppColors.white),
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined,
                              color: AppColors.white, size: 16),
                          const Gap(8),
                          Text(
                            event[index][2],
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
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
