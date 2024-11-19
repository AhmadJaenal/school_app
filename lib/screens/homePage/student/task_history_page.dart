import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:school_app/models/Submission.dart';
import 'package:school_app/services/submission/submission_service.dart';
import 'package:school_app/shared/theme.dart';

class TaskHistoryPage extends StatelessWidget {
  const TaskHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    SubmissionProvider submission =
        Provider.of<SubmissionProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Laporan Kinerja',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: FutureBuilder(
          future: submission.getSubmissionsByUserIdAndDate(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.data!['status']) {
              List<Submission> submission = snapshot.data!['data'];
              return ListView.builder(
                itemCount: submission.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(submission[index].createdAt!,
                          style: AppTextStyle.paragraphLBold),
                      const Gap(8),
                      Image.asset('assets/img_event_2.png'),
                      const Gap(8),
                      Text(submission[index].desc!,
                          style: AppTextStyle.paragraphL),
                      const Gap(8),
                    ],
                  );
                },
              );
            }
            return const Center(child: Text('Tidak ada task yang dikerjakan'));
          },
        ),
      ),
    );
  }
}
