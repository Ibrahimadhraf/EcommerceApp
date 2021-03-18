import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:online_shopping/view/helpers/app_utils.dart';
import 'package:online_shopping/view/helpers/application_colors.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/widgets/common_text_controller.dart';
import 'package:online_shopping/view/widgets/custome_text.dart';
import 'package:online_shopping/view/widgets/horizontal_space.dart';
import 'package:online_shopping/viewmodel/auth_view_model.dart';

import 'login_screen.dart';

class SignUpScreen extends GetWidget<AuthViewModel>{
  final GlobalKey<FormFieldState> emailFormFieldState = GlobalKey();
  final GlobalKey<FormFieldState> nameFormFieldState = GlobalKey();
  final GlobalKey<FormFieldState> passwordFormFieldState = GlobalKey();
  final TextEditingController emailTextEditingController =
  TextEditingController();
  final TextEditingController nameTextEditingController =
  TextEditingController();
  final TextEditingController passwordTextEditingController =
  TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final nameFocus = FocusNode();
  final confirmButton = FocusNode();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Get.off(LoginScreen());
          },
          child: Icon(Icons.arrow_back,
          color: Colors.black,),
        ),
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
              CostumeText(
                  text: 'Sign up',
                  color: Colors.black,
                  fontSize: SizeConfig().fontSize18),

              Form(
                child: Column(
                  children: [
                    CommonTextControllers.customTextField(
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) return "UserName can not be empty!";

                            return null;
                        },
                        labelText: 'Name',
                        height: SizeConfig().safeBlockVertical * 7,
                        isObscureText: false,
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.text,
                        focusNode: nameFocus,
                        fontColor: Colors.black,
                        textFieldColor: Colors.purple,
                        borderColor: Colors.grey,
                        fillColor: Colors.white,
                        formKey: nameFormFieldState,
                        onSubmitted: (trim) => {
                          if (nameFormFieldState.currentState.validate())
                            {
                              AppUtils().fieldFocusChange(
                                  context,nameFocus, emailFocus)
                            }
                        }),
                    HorizontalSpace(
                      space: SizeConfig().safeBlockVertical * 5,
                    ),
                    CommonTextControllers.customTextField(
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) return "Email can not be empty!";
                          if (!value.contains('@'))
                            return "Your email is not valid!";
                          else
                            return null;
                        },
                        labelText: 'email',
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
                      ? controller.createAccountWithEmailAndPassword(

                      emailTextEditingController.text.trim(),
                      passwordTextEditingController.text.trim(),
                      nameTextEditingController.text.trim(),)
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
                        text: 'Sign Up',
                        fontSize: SizeConfig().fontSize16,
                        color: Colors.white,
                      ),
                    )),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
