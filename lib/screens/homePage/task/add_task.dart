import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:school_app/core/platform/status.dart';
import 'package:school_app/models/project.dart';
import 'package:school_app/models/task.dart';
import 'package:school_app/services/project/project.dart';
import 'package:school_app/services/task/task_service.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';
import 'package:school_app/widgets/buttons/custom_button.dart';
import 'package:school_app/widgets/modals/custom_popup_message.dart';
import 'package:school_app/widgets/forms/custom_textfield.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final TextEditingController _descController = TextEditingController(
    text: 'jgk@gmail.com',
  );

  final TextEditingController _titleController = TextEditingController(
    text: 'hadjsdf',
  );

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

  late Future<Map<String, dynamic>> _projectFuture;
  ProjectProvider project = ProjectProvider();

  @override
  void initState() {
    super.initState();
    _projectFuture = project.getAllProject();
  }

  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);

    var loading = const Center(child: CircularProgressIndicator());
    doSubmit() {
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage = taskProvider
            .newTask(
              title: _titleController.text.toString(),
              desc: _descController.text.toString(),
              projectId: projectId!,
            );

        successfulMessage.then((response) {
          if (response['status']) {
            TaskModel task = response['data'];
            context.pop();
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
                'Tambahkan Tugas Baru',
                style: AppTextStyle.h1,
                textAlign: TextAlign.center,
              ),
              const Gap(10),
              Text(
                'Masukan data untuk\nmenambahkan tugas baru',
                style: AppTextStyle.paragraphL.copyWith(
                  color: AppColors.black60,
                ),
                textAlign: TextAlign.center,
              ),
              CustomTextField(
                titleTextField: 'Judul',
                hintText: 'Masukan judul tugas',
                textController: _titleController,
              ),
              CustomTextField(
                titleTextField: 'Deskripsi',
                hintText: 'Masukan deskripsi tugas',
                textController: _descController,
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
                      ...listProject.map((project) => project.name ?? ""),
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
      floatingActionButton: taskProvider.taskStatus == ProcessState.uploading
          ? loading
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppMargin.defaultMargin,
              ),
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
        failedMessage: 'Tugas gagal terdaftar!',
      ),
    );
  }
}
