import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/viewmodel/auth_view_model.dart';
import 'package:online_shopping/viewmodel/control_view_model.dart';

class MainScreen extends GetWidget<ControlViewModel>{
  @override
  Widget build(BuildContext context) {

   return GetBuilder<ControlViewModel>(

        builder: (controller) =>
        Scaffold(
          body: controller.currentScreen, bottomNavigationBar: buttonNavigationBar(),
        ));
  }
  Widget buttonNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) =>
          BottomNavigationBar(items: [
            BottomNavigationBarItem(
                label: '',
                activeIcon: Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig().safeBlockVertical * 2),
                  child: Text('Explore'),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig().safeBlockVertical * 2),
                  child: Image.asset(
                    'images/Icon_Explore.png', fit: BoxFit.contain,
                    width: SizeConfig().safeBlockVertical * 2,),
                )),
            BottomNavigationBarItem(
                label: '',
                activeIcon: Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig().safeBlockVertical * 2),
                  child: Text('Cart'),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig().safeBlockVertical * 2),
                  child: Image.asset('images/Icon_Cart.png', fit: BoxFit.contain,
                    width: SizeConfig().safeBlockVertical * 2,),
                )),
            BottomNavigationBarItem(
                label: '',
                activeIcon: Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig().safeBlockVertical * 2),
                  child: Text('Account'),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig().safeBlockVertical * 2),
                  child: Image.asset('images/Icon_User.png', fit: BoxFit.contain,
                    width: SizeConfig().safeBlockVertical * 2,),
                )),
          ],
            elevation: 0,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.grey.shade50,
            currentIndex: controller.navigatorValue,
            onTap: (index) {
              controller.changeNavigatorValue(index);
            }
            ,),
    );
  }

}
