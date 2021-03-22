import 'package:get/get.dart';
import 'package:online_shopping/view/helpers/local_storage_data.dart';
import 'package:online_shopping/viewmodel/auth_view_model.dart';
import 'package:online_shopping/viewmodel/card_viewmodel.dart';
import 'package:online_shopping/viewmodel/checkout_viewmodel.dart';
import 'package:online_shopping/viewmodel/control_view_model.dart';
import 'package:online_shopping/viewmodel/home_view_model.dart';
import 'package:online_shopping/viewmodel/profile_view_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CardViewModel());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => CheckOutViewModel());
    Get.lazyPut(() => LocalStorageData());
  }
}