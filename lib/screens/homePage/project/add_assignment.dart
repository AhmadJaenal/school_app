import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../models/project.dart';
import '../../../models/user.dart';

import '../../../shared/theme.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_popup_message.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../services/student/student_service.dart';

import '../../../services/project/assignment.dart';
import '../../../services/project/project.dart';

class AddAssignment extends StatefulWidget {
  const AddAssignment({super.key});

  @override
  State<AddAssignment> createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {
  final TextEditingController _descController =
      TextEditingController(text: 'jgk@gmail.com');

  final TextEditingController _titleController =
      TextEditingController(text: 'hadjsdf');

  @override
  void dispose() {
    super.dispose();
    _descController.dispose();
    _titleController.dispose();
  }

  void _clearTextControllers() {
    _descController.clear();
    _titleController.clear();
  }

  final formKey = GlobalKey<FormState>();

  int? projectId;
  int? userId;

  late Future<Map<String, dynamic>> _projectFuture;
  ProjectProvider project = ProjectProvider();

  late Future<Map<String, dynamic>> _studentFuture;
  StudentProvider student = StudentProvider();

  @override
  void initState() {
    super.initState();
    _projectFuture = project.getAllProject();
    _studentFuture = student.getAllStudent();
  }

  @override
  Widget build(BuildContext context) {
    AssignmentProvider assignmentProvider =
        Provider.of<AssignmentProvider>(context);

    var loading = const Center(child: CircularProgressIndicator());
    doSubmit() {
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage =
            assignmentProvider.addAssignment(
          projectId: projectId!,
          userId: userId!,
        );

        successfulMessage.then((response) {
          if (response['status']) {
            Get.back();
            popUpRegister(context, true);
          } else {
            popUpRegister(context, false);
          }
        });
      }
    }

    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Form',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Center(
                child: Image.asset(
                  'assets/img_add_children.png',
                  width: width * .8,
                ),
              ),
              const Gap(24),
              Text(
                'Tugaskan Peserta Magang',
                style: AppTextStyle.h1,
                textAlign: TextAlign.center,
              ),
              const Gap(10),
              Text(
                'Pilih peserta dan proyek\nyang akan ditugaskan',
                style: AppTextStyle.paragraphL.copyWith(
                  color: AppColors.black60,
                ),
                textAlign: TextAlign.center,
              ),
              FutureBuilder(
                future: _studentFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasData) {
                    List<User> listStudent = snapshot.data!['data'];
                    List<String> optionStudent = [
                      "Pilih",
                      ...listStudent.map((student) => student.fullName ?? "")
                    ];

                    return CustomDropdown(
                      titleTextField: 'Pilih Peserta',
                      option: optionStudent,
                      onChanged: (value) {
                        final selectedStudent = listStudent.firstWhere(
                          (project) => project.fullName == value,
                        );

                        userId = selectedStudent.id!;
                      },
                    );
                  }
                  return const Text('Terjadi kesalahan');
                },
              ),
              FutureBuilder(
                future: _projectFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    List<Project> listProject = snapshot.data!['data'];
                    List<String> optionProject = [
                      "Pilih",
                      ...listProject.map((project) => project.name ?? "")
                    ];

                    return CustomDropdown(
                      titleTextField: 'Pilih Proyek',
                      option: optionProject,
                      onChanged: (value) {
                        final selectedProject = listProject.firstWhere(
                          (project) => project.name == value,
                        );

                        projectId = selectedProject.id!;
                      },
                    );
                  }
                  return const Text('Terjadi kesalahan');
                },
              ),
              const Gap(25),
            ],
          ),
        ),
      ),
      floatingActionButton:
          assignmentProvider.assignmentStatus == AssignmentStatus.uploading
              ? loading
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
                  child: PrimaryButton(
                    titleButton: "Simpan",
                    ontap: () {
                      doSubmit();
                      _clearTextControllers();
                    },
                  ),
                ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<dynamic> popUpRegister(BuildContext context, bool isSuccess) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => PopUpMessage(
          isSuccess: isSuccess,
          successMessage: 'Tugas berhasil ditambahkan!',
          failedMessage: 'Tugas gagal terdaftar!'),
    );
  }
}
