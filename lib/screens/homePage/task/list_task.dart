import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_app/models/Task.dart';
import 'package:school_app/services/task/task_service.dart';
import 'package:school_app/shared/theme.dart';
import 'dart:developer' as devlog;

class ListTask extends StatelessWidget {
  const ListTask({super.key});

  @override
  Widget build(BuildContext context) {
    TaskProvider projectProvider = Provider.of<TaskProvider>(context);
    var project = Get.arguments;
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
          'Daftar Tugas',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 14, 24, 16),
        child: FutureBuilder(
          future: projectProvider.getAllTaskByIdProject(project['project_id']),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                List<TaskModel> tasks = snapshot.data!['data'];
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Get.toNamed('/detail-task',
                                arguments: {'id': tasks[index].id!}),
                            child: Text(tasks[index].title!,
                                style: AppTextStyle.paragraphMBold),
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return const Text('Belum ada Task yang bisa dikerjakan');
              }
            }
          },
        ),
      ),
    );
  }
}
