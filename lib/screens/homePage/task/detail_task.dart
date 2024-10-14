import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_app/models/Task.dart';
import 'package:school_app/services/task/task_service.dart';
import 'package:school_app/widgets/custom_button.dart';

import '../../../shared/theme.dart';

class DetailTask extends StatelessWidget {
  const DetailTask({super.key});

  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);

    var task = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.black100,
          ),
        ),
        title: Text(
          'Detail Tugas',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: taskProvider.getTaskByTaskId(task['id']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              TaskModel task = snapshot.data!['data'];
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title!, style: AppTextStyle.paragraphLBold),
                    const Gap(8),
                    Text(task.desc!, style: AppTextStyle.paragraphL),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('Detail tugas tidak tersedia'),
              );
            }
          }
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(AppMargin.defaultMargin),
        child: PrimaryButton(
          ontap: () {},
          titleButton: 'Module',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
