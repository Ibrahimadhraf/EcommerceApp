import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/helpers/constants.dart';
import 'package:online_shopping/view/helpers/enum.dart';
import 'package:online_shopping/view/screens/controller_view.dart';

class CheckOutViewModel extends GetxController{

  int get index=>_index;
  int _index = 0;
  Pages get pages=>_pages;
  Pages _pages = Pages.DeliveryTime;
  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }
  void changeIndex(int i){
    _index=i;
      if(_index==1){
        _pages=Pages.AddAddress;
      }else if(_index==2){
        _pages=Pages.Summary;
      }else{
        Get.to(()=>ControllerView());
      }
     update();
  }
}