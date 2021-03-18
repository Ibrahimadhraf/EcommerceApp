import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get.dart';

import 'package:online_shopping/view/helpers/app_utils.dart';

import 'package:online_shopping/view/helpers/application_colors.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/widgets/common_text_controller.dart';
import 'package:online_shopping/view/widgets/custome_social_media_button.dart';
import 'package:online_shopping/view/widgets/custome_text.dart';
import 'package:online_shopping/view/widgets/horizontal_space.dart';
import 'package:online_shopping/viewmodel/auth_view_model.dart';

import 'sign_up_screen.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final List<String> recipents = ["01114868036"];
  final GlobalKey<FormFieldState> emailFormFieldState = GlobalKey();
  final GlobalKey<FormFieldState> passwordFormFieldState = GlobalKey();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmButton = FocusNode();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig().safeBlockVertical * 10,
          left: SizeConfig().safeBlockVertical * 5,
          right: SizeConfig().safeBlockVertical * 5,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CostumeText(
                      text: 'Welcome',
                      color: Colors.black,
                      fontSize: SizeConfig().fontSize18),
                  GestureDetector(
                    onTap: (){
                      Get.to(SignUpScreen());
                    },
                    child: CostumeText(
                        text: 'Sign up',
                        color: ApplicationColors().primaryColor,
                        fontSize: SizeConfig().fontSize14),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: CostumeText(
                    text: 'Sign in to continue',
                    color: Colors.grey,
                    fontSize: SizeConfig().fontSize12),
              ),
              HorizontalSpace(
                space: SizeConfig().safeBlockVertical * 5,
              ),
              Form(
                child: Column(
                  children: [
                    CommonTextControllers.customTextField(
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) return "Email can not be empty!";
                          if (!value.contains('@'))
                            return "Your email is not valid!";
                          else
                            return null;
                        },
                        labelText: 'Email',
                        height: SizeConfig().safeBlockVertical * 7,
                        isObscureText: false,
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.text,
focusNode: emailFocus,
                        fontColor: Colors.black,
                        textFieldColor: Colors.purple,
                        borderColor: Colors.grey,
                        fillColor: Colors.white,
                        formKey: emailFormFieldState,
                        onSubmitted: (trim) => {
                              if (emailFormFieldState.currentState.validate())
                                {
                                  AppUtils().fieldFocusChange(
                                      context, emailFocus, passwordFocus)
                                }
                            }),
                    HorizontalSpace(
                      space: SizeConfig().safeBlockVertical * 5,
                    ),
                    CommonTextControllers.customTextField(
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {return 'Password can not be empty!';}
                         else if (value.length < 6){
                            return 'Your password should be at least 6 digits!';
                          }

                          else
                            return null;
                        },
                        labelText: 'Password',
                        height: SizeConfig().safeBlockVertical * 7,
                        controller: passwordTextEditingController,
                        formKey: passwordFormFieldState,
                        focusNode: passwordFocus,
                        isObscureText: false,
                        keyboardType: TextInputType.text,
                        fontColor: Colors.black,
                        textFieldColor: Colors.purple,
                        borderColor: Colors.grey,
                        fillColor: Colors.white,
                        onSubmitted: (trim) => {
                              if (passwordFormFieldState.currentState.validate())
                                {
                                  AppUtils().fieldFocusChange(
                                      context, passwordFocus, confirmButton)
                                }
                            }),
                  ],
                ),
              ),
              HorizontalSpace(
                space: SizeConfig().safeBlockVertical * 5,
              ),
              Container(
                alignment: Alignment.topRight,
                child: CostumeText(
                    text: 'Forget Password ?',
                    fontSize: SizeConfig().fontSize14),
              ),
              HorizontalSpace(
                space: SizeConfig().safeBlockVertical * 3,
              ),
              InkWell(
                focusNode: confirmButton,
                onTap: () {
                  emailFormFieldState.currentState.validate() &&
                          passwordFormFieldState.currentState.validate()
                      ? controller.signInWithEmailAndPassword(
                          emailTextEditingController.text.trim(),
                          passwordTextEditingController.text.trim())
                      : AppUtils().applicationSnackPar(
                          title: 'Error to login',
                          message: "All fields is required");
                },
                child: Container(
                    decoration: new BoxDecoration(
                      color: ApplicationColors().primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: SizeConfig().safeBlockVertical * 5,
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          EdgeInsets.all(SizeConfig().safeBlockVertical * 1),
                      child: CostumeText(
                        text: 'Sign In',
                        fontSize: SizeConfig().fontSize16,
                        color: Colors.white,
                      ),
                    )),
              ),
              HorizontalSpace(
                space: SizeConfig().safeBlockVertical * 3,
              ),
              Container(
                alignment: Alignment.center,
                child: CostumeText(text: '_OR_'),
              ),
              HorizontalSpace(
                space: SizeConfig().safeBlockVertical * 3,
              ),
              CostumeSocialMediaButton(
                text: 'Sign In with Google ',
                imageBath: 'images/google.png',
                onPress: () {
                  // _sendSMS("بنجرب يا خلق !", recipents);
                  controller.signInMethod();
                },
              ),
              HorizontalSpace(
                space: SizeConfig().safeBlockVertical * 3,
              ),
              CostumeSocialMediaButton(
                text: 'Sign In with Facebook ',
                imageBath: 'images/facebook.png',
                onPress: () {
                  controller.facebookSignInMethod();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}
