import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_app/core/platform/status.dart';
import '../../../models/submission.dart';
import '../../../services/submission/submission_service.dart';
import '../../../services/task/task_service.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_popup_message.dart';

import '../../../shared/theme.dart';

class SubmissionTask extends StatelessWidget {
  const SubmissionTask({super.key});

  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);

    SubmissionProvider submission = Provider.of<SubmissionProvider>(context);
    var loading = const Center(child: CircularProgressIndicator());

    deleteSubmission() async {
      final Future<Map<String, dynamic>> successfulMessage =
          submission.deleteSubmission();

      successfulMessage.then((response) {
        if (response['status']) {
          Get.toNamed('/list-task');
          popUpSubmission(context, true);
        } else {
          popUpSubmission(context, false);
        }
      });
    }

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
          'Submission Tugas',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                elevation: 0,
                builder: (context) => Container(
                  width: double.infinity,
                  height: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
                  margin: EdgeInsets.symmetric(
                    horizontal: AppMargin.defaultMargin,
                    vertical: 28,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hapus',
                        style: AppTextStyle.h3.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        'Apakah Anda yakin ingin menghapus submission?',
                        style: AppTextStyle.paragraphL.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 130,
                            child: SecondaryButton(
                                titleButton: 'Batal', ontap: () => Get.back()),
                          ),
                          SizedBox(
                            width: 130,
                            child: submission.submissionStatus ==
                                    ProcessState.uploading
                                ? loading
                                : PrimaryButton(
                                    ontap: () {
                                      deleteSubmission();
                                      Get.back();
                                    },
                                    titleButton: 'Ya'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: AppMargin.defaultMargin),
              child:
                  Icon(Icons.delete_outline_outlined, color: AppColors.danger1),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: ListView(
          children: [
            FutureBuilder(
              future: taskProvider.getSubmissionByTaskIdAndUserId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.data!['status']) {
                  return const Center(
                      child: Text('Anda belum mengerjakan tugas ini'));
                }
                Submission submission = snapshot.data!['data'];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(submission.createdAt!,
                          style: AppTextStyle.paragraphLBold),
                      const Gap(8),
                      Image.asset('assets/img_event_2.png'),
                      const Gap(8),
                      Text(submission.desc!, style: AppTextStyle.paragraphL),
                      const Gap(8),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(AppMargin.defaultMargin),
        child: PrimaryButton(
          ontap: () {},
          titleButton: 'Update Submission',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<dynamic> popUpSubmission(BuildContext context, bool isSuccess) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => PopUpMessage(
          isSuccess: isSuccess,
          successMessage: 'Submission berhasil dihapus!',
          failedMessage: 'Submission gagal dihapus!'),
    );
  }
}
