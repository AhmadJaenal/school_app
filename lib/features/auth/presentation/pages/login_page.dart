import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/routing/app_routes.dart';
import 'package:school_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';
import 'package:school_app/widgets/buttons/custom_button.dart';
import 'package:school_app/widgets/forms/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.go(Routes.nav);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.failure.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
            child: Form(
              key: _formKey,
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
                        const TextSpan(text: 'Selamat Datang👋\ndi '),
                        TextSpan(
                          text: 'Labschool App.',
                          style: AppTextStyle.h1.copyWith(
                            color: AppColors.primary1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(5),
                  Text(
                    "Halo, silakan masuk untuk melanjutkan",
                    style: AppTextStyle.paragraphM.copyWith(
                      color: AppColors.black80,
                    ),
                  ),
                  const Gap(10),
                  CustomTextField(
                    hintText: "Masukan email",
                    titleTextField: 'Email',
                    textController: _emailController,
                  ),
                  CustomTextFieldPassword(
                    titleTextField: 'Password',
                    textController: _passwordController,
                    hintText: 'Masukan password',
                  ),
                  const Gap(10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => context.push(Routes.forgotPassword),
                      child: Text(
                        "Lupa Password ?",
                        style: AppTextStyle.paragraphM.copyWith(
                          color: AppColors.secondary1,
                        ),
                      ),
                    ),
                  ),
                  const Gap(30),
                  PrimaryButton(
                    titleButton: isLoading ? 'Memproses...' : 'Masuk',
                    ontap: () {
                      if (isLoading || !_formKey.currentState!.validate()) {
                        return;
                      }
                      context.read<AuthCubit>().login(
                        username: _emailController.text.trim(),
                        password: _passwordController.text,
                      );
                    },
                  ),
                  const Spacer(),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.push(Routes.register);
                      },
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyle.paragraphM.copyWith(
                            color: AppColors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Belum punya akun? '),
                            TextSpan(
                              text: 'Daftar',
                              style: AppTextStyle.paragraphM.copyWith(
                                color: AppColors.secondary1,
                              ),
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
      },
    );
  }
}
