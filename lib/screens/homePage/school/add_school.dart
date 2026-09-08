import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:school_app/core/platform/status.dart';
import 'package:school_app/services/auth/student_auth.dart';
import 'package:school_app/services/school/school_service.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';
import 'package:school_app/widgets/buttons/custom_button.dart';
import 'package:school_app/widgets/modals/custom_popup_message.dart';
import 'package:school_app/widgets/forms/custom_textfield.dart';

class AddSchool extends StatelessWidget {
  AddSchool({super.key});
  final TextEditingController _nameController = TextEditingController(
    text: 'SMK PUI CIKIJING',
  );
  final TextEditingController _durationInternController = TextEditingController(
    text: '9',
  );

  void dispose() {
    _nameController.dispose();
    _durationInternController.dispose();
  }

  void _clearTextControllers() {
    _nameController.clear();
    _durationInternController.clear();
  }

  final formKey = GlobalKey<FormState>();

  int? schoolId;

  @override
  Widget build(BuildContext context) {
    SchoolProvider schoolProvider = Provider.of<SchoolProvider>(context);
    StudentAuthProvider studentAuth = Provider.of<StudentAuthProvider>(context);

    var loading = const Center(child: CircularProgressIndicator());
    addSchool() {
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage = schoolProvider
            .addNewSchool(
              name: _nameController.text.toString(),
              durationIntern: int.parse(_durationInternController.text),
            );

        successfulMessage.then((response) {
          if (response['status']) {
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
                'Tambahkan\nSekolah Baru',
                style: AppTextStyle.h1,
                textAlign: TextAlign.center,
              ),
              const Gap(10),
              Text(
                'Masukan data untuk\nmenambahkan sekolah baru',
                style: AppTextStyle.paragraphL.copyWith(
                  color: AppColors.black60,
                ),
                textAlign: TextAlign.center,
              ),
              CustomTextField(
                titleTextField: 'Nama',
                hintText: 'Masukan nama sekolah',
                textController: _nameController,
              ),
              CustomTextField(
                titleTextField: 'Durasi',
                hintText: 'Masukan durasi magang',
                textController: _durationInternController,
              ),
              const Gap(25),
            ],
          ),
        ),
      ),
      floatingActionButton:
          studentAuth.registeredInStatus == AuthStatus.registering
          ? loading
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppMargin.defaultMargin,
              ),
              child: PrimaryButton(
                titleButton: "Simpan",
                ontap: () {
                  addSchool();
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
        successMessage: 'Sekolah berhasil ditambahkan!',
        failedMessage: 'Sekolah gagal ditambahkan!',
      ),
    );
  }
}
