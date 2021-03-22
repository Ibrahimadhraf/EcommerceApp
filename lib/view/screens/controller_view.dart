import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/screens/main_screen.dart';

import 'authentication/login_screen.dart';

import 'package:online_shopping/view/helpers/size_config.dart';


import 'package:online_shopping/viewmodel/auth_view_model.dart';
import 'package:online_shopping/viewmodel/control_view_model.dart';

class ControllerView extends GetWidget<AuthViewModel> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : MainScreen();

    });
  }

}
