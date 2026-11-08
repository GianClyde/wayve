import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wayve/features/authentication/presentation/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Login success")));
          context.go("/");
        }

        if (state is AuthFailure) {
          debugPrint("Login Error: ${state.message}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login failed.${state.message}")),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(label: Text("Email")),
              controller: _emailController,
            ),
            TextFormField(
              decoration: InputDecoration(label: Text("Password")),
              controller: _passwordController,
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                  EmailLoginRequested(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
