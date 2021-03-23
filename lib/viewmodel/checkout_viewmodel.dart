import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/helpers/constants.dart';
import 'package:online_shopping/view/helpers/enum.dart';
import 'package:online_shopping/view/screens/controller_view.dart';

class CheckOutViewModel extends GetxController{
  String street1,street2,city,state,country;
  final GlobalKey<FormState> addressFormFieldState = GlobalKey();
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
    if(i==0||i<0){
      _pages=Pages.DeliveryTime;
      _index=i;

    }
      else if(i==1){

          _pages=Pages.AddAddress;

           _index=i;
      }else if(i==2){
        addressFormFieldState.currentState.save();
  if(addressFormFieldState.currentState.validate()) {
    _pages = Pages.Summary;
    _index=i;
  }
      }else{
        Get.to(()=>ControllerView());
        _pages=Pages.DeliveryTime;
        _index=0;
      }
     update();
  }
}