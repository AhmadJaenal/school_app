import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:school_app/core/platform/status.dart';
import 'package:school_app/services/task/task_service.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';
import 'package:school_app/widgets/buttons/custom_button.dart';
import 'package:school_app/widgets/modals/custom_popup_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/task.dart';

class ListTask extends StatelessWidget {
  const ListTask({super.key});

  saveTaskId(taskId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('taskId', taskId);
  }

  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);

    var loading = const Center(child: CircularProgressIndicator());

    deleteTask() async {
      final Future<Map<String, dynamic>> successfulMessage = taskProvider
          .deleteTaskById();

      successfulMessage.then((response) {
        if (response['status']) {
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
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Daftar Tugas',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 14, 24, 16),
        child: FutureBuilder(
          future: taskProvider.getAllTask(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Tidak ada tugas'));
            }
            List<TaskModel> tasks = snapshot.data!['data'];
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    saveTaskId(tasks[index].id);
                    context.push('/detail-task');
                  },
                  onLongPress: () => showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    builder: (context) => Container(
                      width: double.infinity,
                      height: 185,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 22,
                      ),
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
                            'Hapus Tugas',
                            style: AppTextStyle.h3.copyWith(
                              color: AppColors.darkBlue,
                            ),
                          ),
                          const Gap(8),
                          Text(
                            'Apakah Anda yakin ingin hapus tugas ini?',
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
                                  titleButton: 'Batal',
                                  ontap: () => context.pop(),
                                ),
                              ),
                              taskProvider.taskStatus == ProcessState.delete
                                  ? loading
                                  : SizedBox(
                                      width: 130,
                                      child: PrimaryButton(
                                        titleButton: 'Ya',
                                        ontap: () {
                                          saveTaskId(tasks[index].id);
                                          deleteTask();
                                          context.pop();
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primary1.withOpacity(.1),
                    ),
                    child: Text(
                      tasks[index].title!,
                      style: AppTextStyle.paragraphMBold,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary1,
          minimumSize: const Size(62, 62),
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
        ),
        onPressed: () {
          context.push('/new-task');
        },
        child: Icon(Icons.add, color: AppColors.white, size: 32, weight: 2),
      ),
    );
  }

  Future<dynamic> popUpSubmission(BuildContext context, bool isSuccess) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => PopUpMessage(
        isSuccess: isSuccess,
        successMessage: 'Tugas berhasil dihapus!',
        failedMessage: 'Tugas gagal dihapus!',
      ),
    );
  }

  saveIntenshipId(idInternship) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('internshipId', idInternship);
  }
}
