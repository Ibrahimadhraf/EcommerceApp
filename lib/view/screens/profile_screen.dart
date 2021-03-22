import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/screens/authentication/login_screen.dart';
import 'package:online_shopping/view/widgets/custome_text.dart';
import 'package:online_shopping/view/widgets/horizontal_space.dart';
import 'package:online_shopping/viewmodel/profile_view_model.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
        body: controller.loading.value?Center(child: CircularProgressIndicator()): Padding(
          padding: EdgeInsets.only(top: SizeConfig().safeBlockHorizontal * 15),
          child: Container(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: SizeConfig().safeBlockHorizontal * 20,
                        height: SizeConfig().safeBlockHorizontal * 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: controller.userModel == null
                                  ? AssetImage('images/defoult_pic.png')
                                  : controller.userModel.picture == 'default'
                                      ? AssetImage('images/defoult_pic.png')
                                      : NetworkImage(
                                          controller.userModel.picture),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Column(
                        children: [
                          CostumeText(
                            text: controller.userModel == null
                                ? ""
                                : controller.userModel.name,
                            color: Colors.black,
                            fontSize: SizeConfig().fontSize16,
                          ),
                          CostumeText(
                            text: controller.userModel.email,
                            color: Colors.black,
                            fontSize: SizeConfig().fontSize16,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                HorizontalSpace(
                  space: SizeConfig().safeBlockVertical * 4,
                ),
                Container(
                  child: ListTile(
                    title: CostumeText(
                      text: 'Edit Profile',
                      color: Colors.black,
                      fontSize: SizeConfig().fontSize16,
                    ),
                   trailing: Icon(
                     Icons.navigate_next,
                     color: Colors.black,
                   ),
                   leading: Icon(FontAwesomeIcons.userEdit),
                    onTap: (){},
                  ),
                ),
                HorizontalSpace(
                  space: SizeConfig().safeBlockVertical * 4,
                ),
                Container(
                  child: ListTile(
                    title: CostumeText(
                      text: 'Shipping address',
                      color: Colors.black,
                      fontSize: SizeConfig().fontSize16,
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                    ),
                    leading: Icon(FontAwesomeIcons.searchLocation),
                    onTap: (){},
                  ),
                ),
                HorizontalSpace(
                  space: SizeConfig().safeBlockVertical * 4,
                ),
                Container(
                  child: ListTile(
                    title: CostumeText(
                      text: 'Order history',
                      color: Colors.black,
                      fontSize: SizeConfig().fontSize16,
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                    ),
                    leading: Icon(FontAwesomeIcons.history),
                    onTap: (){},
                  ),
                ),
                HorizontalSpace(
                  space: SizeConfig().safeBlockVertical * 4,
                ),
                Container(
                  child: ListTile(
                    title: CostumeText(
                      text: 'Card',
                      color: Colors.black,
                      fontSize: SizeConfig().fontSize16,
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                    ),
                    leading: Icon(FontAwesomeIcons.shoppingCart),
                    onTap: (){},
                  ),
                ),
                HorizontalSpace(
                  space: SizeConfig().safeBlockVertical * 4,
                ),
                Container(
                  child: ListTile(
                    title: CostumeText(
                      text: 'Notification',
                      color: Colors.black,
                      fontSize: SizeConfig().fontSize16,
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                    ),
                    leading: Icon(Icons.notifications),
                    onTap: (){},
                  ),
                ),
                HorizontalSpace(
                  space: SizeConfig().safeBlockVertical * 4,
                ),
                Container(
                  child: ListTile(
                    title: CostumeText(
                      text: 'Log out',
                      color: Colors.black,
                      fontSize: SizeConfig().fontSize16,
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                    ),
                    leading: Icon(Icons.logout),
                    onTap: (){
                      controller.signOut();
                      Get.offAll(()=>LoginScreen());
                    },
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
