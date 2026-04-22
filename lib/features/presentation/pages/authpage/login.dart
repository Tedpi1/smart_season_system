import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/auth_viewmodel.dart';


class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: usernameController),
            TextField(controller: passwordController, obscureText: true),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: vm.isLoading
                  ? null
                  : () {
                vm.login(
                  usernameController.text,
                  passwordController.text,
                );
              },
              child: vm.isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Login"),
            ),

            if (vm.error != null)
              Text(vm.error!, style: const TextStyle(color: Colors.red)),

            if (vm.username != null)
              Text("Welcome ${vm.username}"),
          ],
        ),
      ),
    );
  }
}