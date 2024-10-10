import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CreateNewPasswordView extends GetView {
  const CreateNewPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateNewPasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CreateNewPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
