import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_app/models/user.dart';
import 'package:school_app/provider/student/index.dart';
import 'package:school_app/services/auth/student_auth.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_popup_message.dart';
import 'package:school_app/widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final formKey = GlobalKey<FormState>();
TextEditingController _nisn = TextEditingController(text: 'intern@gmail.com');
TextEditingController _passwordC = TextEditingController(text: 'password');
@override
void dispose() {
  _nisn.dispose();
  _passwordC.dispose();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    StudentAuthProvider studentAuth = Provider.of<StudentAuthProvider>(context);

    var loading = const Center(child: CircularProgressIndicator());
    doLogin() {
      final form = formKey.currentState;

      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage =
            studentAuth.login(
                email: _nisn.text.toString(),
                password: _passwordC.text.toString());

        successfulMessage.then((response) {
          if (response['status']) {
            User user = response['data'];
            Provider.of<StudentProvider>(context, listen: false)
                .setStudent(user);
            Navigator.of(context).pushReplacementNamed('/nav');

            popUpLogin(context, true);
          } else {
            popUpLogin(context, false);
          }
        });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(99),
              Image.asset('assets/logo.png', width: 80),
              const Gap(20),
              RichText(
                text: TextSpan(
                  style: AppTextStyle.h1.copyWith(color: AppColors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Selamat Datang👋\ndi ',
                    ),
                    TextSpan(
                      text: 'Labschool App.',
                      style:
                          AppTextStyle.h1.copyWith(color: AppColors.primary1),
                    ),
                  ],
                ),
              ),
              const Gap(5),
              Text(
                "Halo, silakan masuk untuk melanjutkan",
                style:
                    AppTextStyle.paragraphM.copyWith(color: AppColors.black80),
              ),
              const Gap(10),
              CustomTextField(
                hintText: "Masukan NISN",
                titleTextField: 'NISN',
                textController: _nisn,
              ),
              CustomTextFieldPassword(
                  titleTextField: 'Password',
                  textController: _passwordC,
                  hintText: 'Masukan password'),
              const Gap(10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Get.toNamed('/forgot-password'),
                  child: Text(
                    "Lupa Password ?",
                    style: AppTextStyle.paragraphM
                        .copyWith(color: AppColors.secondary1),
                  ),
                ),
              ),
              const Gap(30),
              studentAuth.loggedInStatus == Status.authenticating
                  ? loading
                  : PrimaryButton(titleButton: "Masuk", ontap: () => doLogin()),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/register');
                  },
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyle.paragraphM
                          .copyWith(color: AppColors.black),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Belum punya akun? ',
                        ),
                        TextSpan(
                          text: 'Daftar',
                          style: AppTextStyle.paragraphM
                              .copyWith(color: AppColors.secondary1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> popUpLogin(BuildContext context, bool isSuccess) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => PopUpMessage(
          isSuccess: isSuccess,
          successMessage: 'Login berhasil!',
          failedMessage: 'Email atau password salah!'),
    );
  }
}
