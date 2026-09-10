import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/core/di/injection.dart';
import 'package:school_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:school_app/routing/app_routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => AuthCubit(sl()),
    child: BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) context.go(Routes.homePage);
        if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.failure.message)));
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Masuk')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                controller: username,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: state is AuthLoading
                    ? null
                    : () => context.read<AuthCubit>().login(
                        username: username.text.trim(),
                        password: password.text,
                      ),
                child: state is AuthLoading
                    ? const CircularProgressIndicator()
                    : const Text('Masuk'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
