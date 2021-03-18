import 'package:get/get.dart';
import 'package:online_shopping/viewmodel/auth_view_model.dart';
import 'package:online_shopping/viewmodel/card_viewmodel.dart';
import 'package:online_shopping/viewmodel/control_view_model.dart';
import 'package:online_shopping/viewmodel/home_view_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CardViewModel());
  }
}