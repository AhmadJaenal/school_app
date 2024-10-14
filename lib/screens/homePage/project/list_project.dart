import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_app/models/project.dart';
import 'package:school_app/services/project/project.dart';
import 'package:school_app/shared/theme.dart';

import 'package:school_app/widgets/card_project.dart';

class ListProject extends StatelessWidget {
  const ListProject({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectProvider projectProvider = Provider.of<ProjectProvider>(context);

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
          'Daftar Proyek',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 14, 24, 16),
        child: FutureBuilder(
          future: projectProvider.getAllProject(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                List<Project> project = snapshot.data!['data'];
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: project.length,
                  itemBuilder: (context, index) =>
                      CardProject(project: project[index]),
                );
              } else {
                return const Text('Belum ada project yang bisa dikerjakan');
              }
            }
          },
        ),
      ),
    );
  }
}
