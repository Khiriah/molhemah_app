import 'package:advisor/features/profile/view/widget/new_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controller/profile_conroller.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({
    Key? key,
  }) : super(key: key);

  final profileController = Get.find<ProfileController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
          ),
          body: SingleChildScrollView(
              child: Form(
                  key: formKey,
                  child: Column(children: [
                    NewPasswordWidget(profileController: profileController,)
                  ]))));
    });
  }
}
