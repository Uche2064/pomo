import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginView extends GetView {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
