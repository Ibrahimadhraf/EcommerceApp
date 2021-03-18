import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils{
  AppUtils ._internal();
  static final AppUtils _instance = AppUtils._internal();
  factory AppUtils()=>_instance;
   fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  void applicationSnackPar( {String title ,String message}){
    Get.snackbar(title, message ,
        colorText: Colors.black ,
        snackPosition: SnackPosition.BOTTOM);
  }
}