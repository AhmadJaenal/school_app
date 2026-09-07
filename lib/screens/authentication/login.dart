import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
TextEditingController _emailC = TextEditingController(text: 'ahmad@gmail.com');
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
              RichText(
                text: TextSpan(
                  style: AppTextStyle.h1.copyWith(color: AppColors.black),
                  children: [
                    const TextSpan(
                      text: 'Selamat Datang👋\ndi ',
                    ),
                    WidgetSpan(
                      child: Image.asset(
                        'assets/logo_cyberlabs.png', // Path gambar di folder assets
                        width: 180,
                      ),
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
                  onTap: () => {},
                  child: Text(
                    "Lupa Password ?",
                    style: AppTextStyle.paragraphM
                        .copyWith(color: AppColors.primary1),
                  ),
                ),
              ),
              const Gap(30),
              PrimaryButton(
                  titleButton: "Masuk",
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                    } else {
                      print('validasi gagal');
                    }
                  }),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {},
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
                              .copyWith(color: AppColors.primary1),
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
