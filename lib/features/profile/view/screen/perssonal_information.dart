import '../../logic/controller/profile_conroller.dart';
import 'package:advisor/features/profile/view/widget/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({Key? key}) : super(key: key);

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
                  child: PersonalInformationWidget(
                    profileController: profileController,
                  ))));
    });
  }
}
