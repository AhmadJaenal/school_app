import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:school_app/core/platform/status.dart';
import 'package:school_app/models/school.dart';
import 'package:school_app/models/user.dart';
import 'package:school_app/services/auth/student_auth.dart';
import 'package:school_app/services/school/school_service.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_popup_message.dart';
import 'package:school_app/widgets/custom_textfield.dart';

class AddChildren extends StatefulWidget {
  const AddChildren({super.key});

  @override
  State<AddChildren> createState() => _AddChildrenState();
}

class _AddChildrenState extends State<AddChildren> {
  final TextEditingController _emailController = TextEditingController(
    text: 'jgk@gmail.com',
  );

  final TextEditingController _nameController = TextEditingController(
    text: 'hadjsdf',
  );

  final TextEditingController _passwordController = TextEditingController(
    text: 'password',
  );

  void _clearTextControllers() {
    _emailController.clear();
    _nameController.clear();
    _passwordController.clear();
  }

  final formKey = GlobalKey<FormState>();

  int? schoolId;

  late Future<Map<String, dynamic>> _schoolFuture;
  SchoolProvider school = SchoolProvider();

  @override
  void initState() {
    super.initState();
    _schoolFuture = school.getAllSchool();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StudentAuthProvider studentAuth = Provider.of<StudentAuthProvider>(context);

    var loading = const Center(child: CircularProgressIndicator());
    doRegister() {
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage = studentAuth
            .register(
              name: _nameController.text.toString(),
              email: _emailController.text.toString(),
              password: _passwordController.text.toString(),
              schoolId: schoolId!,
            );

        successfulMessage.then((response) {
          if (response['status']) {
            User user = response['data'];
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
          'Peserta Magang Baru',
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
                'Tambahkan Siswa',
                style: AppTextStyle.h1,
                textAlign: TextAlign.center,
              ),
              const Gap(10),
              Text(
                'Masukan data untuk\nmenambahkan data peserta magang baru',
                style: AppTextStyle.paragraphL.copyWith(
                  color: AppColors.black60,
                ),
                textAlign: TextAlign.center,
              ),
              CustomTextField(
                titleTextField: 'Email',
                hintText: 'Masukan email peserta',
                textController: _emailController,
              ),
              CustomTextField(
                titleTextField: 'Nama',
                hintText: 'Masukan nama peserta',
                textController: _nameController,
              ),
              CustomTextFieldPassword(
                titleTextField: 'Password',
                hintText: 'Masukan password',
                textController: _passwordController,
              ),
              FutureBuilder(
                future: _schoolFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    List<SchoolModel> listSchool = snapshot.data!['data'];
                    List<String> optionClass = [
                      "Pilih",
                      ...listSchool.map((school) => school.name ?? ""),
                    ];

                    return CustomDropdown(
                      titleTextField: 'Sekolah',
                      option: optionClass,
                      onChanged: (value) {
                        final selectedSchool = listSchool.firstWhere(
                          (school) => school.name == value,
                        );

                        schoolId = selectedSchool.id!;
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
          studentAuth.registeredInStatus == AuthStatus.registering
          ? loading
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppMargin.defaultMargin,
              ),
              child: PrimaryButton(
                titleButton: "Simpan",
                ontap: () {
                  doRegister();
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
        successMessage: 'Register berhasil!',
        failedMessage: 'Email sudah terdaftar!',
      ),
    );
  }
}
