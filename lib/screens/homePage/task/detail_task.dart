import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:school_app/datasource/local_datasource.dart';
import 'package:school_app/models/task.dart';
import 'package:school_app/services/task/task_service.dart';
import 'package:school_app/widgets/custom_button.dart';

import '../../../shared/theme.dart';

class DetailTask extends StatelessWidget {
  const DetailTask({super.key});

  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    UserPreferences userPrefs = UserPreferences();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 170),
        child: ListView(
          children: [
            FutureBuilder(
              future: taskProvider.getTaskByTaskId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (!snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'Detail tugas tidak tersedia',
                        style: AppTextStyle.paragraphL,
                      ),
                    ),
                  );
                }
                TaskModel task = snapshot.data!['data'];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppMargin.defaultMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title!, style: AppTextStyle.h3),
                      const Gap(8),
                      Text(task.desc!, style: AppTextStyle.paragraphL),
                    ],
                  ),
                );
              },
            ),
            const Gap(16),
            FutureBuilder(
              future: userPrefs.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data!.roles!.contains('intern')) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppMargin.defaultMargin,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Submission', style: AppTextStyle.h3),
                        const Gap(8),
                        SizedBox(
                          width: 130,
                          height: 32,
                          child: ElevatedButton(
                            onPressed: () {
                              context.push('/submission-task');
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColors.primary1,
                              minimumSize: const Size(double.infinity, 56),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Tugas Kamu',
                              style: AppTextStyle.paragraphSBold.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FutureBuilder(
        future: userPrefs.getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.roles!.contains('intern')) {
            return Padding(
              padding: EdgeInsets.all(AppMargin.defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(ontap: () {}, titleButton: 'Module'),
                  const Gap(10),
                  PrimaryButton(
                    ontap: () => context.push('/add-submission'),
                    titleButton: 'Add Submission',
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
