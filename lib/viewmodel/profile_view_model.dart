import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_shopping/model/user_model.dart';
import 'package:online_shopping/view/helpers/local_storage_data.dart';

class ProfileViewModel extends GetxController{
  final LocalStorageData _localStorageData =Get.find();
  UserModel _userModel;
  UserModel get userModel=>_userModel;
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future<void>signOut() async{
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    FacebookLogin().logOut();
    _localStorageData.deleteUser();
  }

  void getCurrentUser() async{
    _loading.value=true;

    await _localStorageData.getUser.then((value){
      _userModel=value;
      print(value.name);
      print(value.email);
      print(value.picture);

    });
    _loading.value=false;
    update();

  }
  }