import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/screens/card_screen.dart';
import 'package:online_shopping/view/screens/home_screen.dart';
import 'package:online_shopping/view/screens/profile_screen.dart';


class ControlViewModel extends GetxController{
  int _navigatorValue=0;
  get navigatorValue=>_navigatorValue;
  Widget currentScreen=HomeScreen();
  void changeNavigatorValue(int selectedValue){
    _navigatorValue=selectedValue;
    switch(selectedValue){
      case 0:
        currentScreen=HomeScreen();
        break;
      case 1:
        currentScreen=CardScreen();
        break;
      case 2:
        currentScreen=ProfileScreen();
        break;
    }
    update();
  }

}