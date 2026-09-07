import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../models/task.dart';
import '../../../services/task/task_service.dart';
import '../../../shared/theme.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TaskProject extends StatelessWidget {
  const TaskProject({super.key});

  saveTaskId(taskId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('taskId', taskId);
  }

  @override
  Widget build(BuildContext context) {
    TaskProvider projectProvider = Provider.of<TaskProvider>(context);
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
          'Daftar Tugas',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 14, 24, 16),
        child: FutureBuilder(
          future: projectProvider.getAllTaskByIdProject(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data!['status']) {
              List<TaskModel> tasks = snapshot.data!['data'];
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            saveTaskId(tasks[index].id);
                            context.push('/detail-task');
                          },
                          child: Text(
                            tasks[index].title!,
                            style: AppTextStyle.paragraphMBold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return Center(
              child: Text(
                'Belum ada untuk proyek ini',
                style: AppTextStyle.paragraphL,
              ),
            );
          },
        ),
      ),
    );
  }
}
