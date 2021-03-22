import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/helpers/application_colors.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/widgets/common_text_controller.dart';
import 'package:online_shopping/view/widgets/custome_text.dart';
import 'package:online_shopping/view/widgets/horizontal_space.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HorizontalSpace(
              space: SizeConfig().safeBlockVertical * 4,
            ),
            Container(
              alignment: Alignment.center,
              child: CostumeText(
                fontSize: SizeConfig().fontSize14,
                text: 'Billing address is the same as delivery address',
              ),
            ),
            HorizontalSpace(
              space: SizeConfig().safeBlockVertical * 4,
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
                labelText: 'Street1',
                hint: '21 Alex Davidson Avenue',
                height: SizeConfig().safeBlockVertical * 7,
                isObscureText: false,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: ApplicationColors().primaryColor),
                ),
                // controller: emailTextEditingController,
                keyboardType: TextInputType.text,
                // focusNode: emailFocus,
                fontColor: Colors.black,
                textFieldColor: Colors.purple,
                borderColor: Colors.grey,
                fillColor: Colors.white,
                // formKey: emailFormFieldState,
                onSubmitted: (trim) => {
                      // if (emailFormFieldState.currentState.validate())
                      //   {
                      //     AppUtils().fieldFocusChange(
                      //         context, emailFocus, passwordFocus)
                      //   }
                    }),
            HorizontalSpace(
              space: SizeConfig().safeBlockVertical * 4,
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
                labelText: 'Street2',
                hint: 'Victoria Island',
                height: SizeConfig().safeBlockVertical * 7,
                isObscureText: false,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: ApplicationColors().primaryColor),
                ),
                // controller: emailTextEditingController,
                keyboardType: TextInputType.text,
                // focusNode: emailFocus,
                fontColor: Colors.black,
                textFieldColor: Colors.purple,
                borderColor: Colors.grey,
                fillColor: Colors.white,
                // formKey: emailFormFieldState,
                onSubmitted: (trim) => {
                  // if (emailFormFieldState.currentState.validate())
                  //   {
                  //     AppUtils().fieldFocusChange(
                  //         context, emailFocus, passwordFocus)
                  //   }
                }),
            HorizontalSpace(
              space: SizeConfig().safeBlockVertical * 4,
            ),
            Container(
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right:20.0),
                      child: CommonTextControllers.customTextField(
                          maxLines: 1,
                          validator: (value) {
                            if (value.isEmpty) return "Email can not be empty!";
                            if (!value.contains('@'))
                              return "Your email is not valid!";
                            else
                              return null;
                          },
                          labelText: 'State',

                          height: SizeConfig().safeBlockVertical * 7,
                          isObscureText: false,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(color: ApplicationColors().primaryColor),
                          ),
                          // controller: emailTextEditingController,
                          keyboardType: TextInputType.text,
                          // focusNode: emailFocus,
                          fontColor: Colors.black,
                          textFieldColor: Colors.purple,
                          borderColor: Colors.grey,
                          fillColor: Colors.white,
                          // formKey: emailFormFieldState,
                          onSubmitted: (trim) => {
                            // if (emailFormFieldState.currentState.validate())
                            //   {
                            //     AppUtils().fieldFocusChange(
                            //         context, emailFocus, passwordFocus)
                            //   }
                          }),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right:20.0),
                      child: CommonTextControllers.customTextField(
                          maxLines: 1,
                          validator: (value) {
                            if (value.isEmpty) return "Email can not be empty!";
                            if (!value.contains('@'))
                              return "Your email is not valid!";
                            else
                              return null;
                          },
                          labelText: 'Country',

                          height: SizeConfig().safeBlockVertical * 7,
                          isObscureText: false,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(color: ApplicationColors().primaryColor),
                          ),
                          // controller: emailTextEditingController,
                          keyboardType: TextInputType.text,
                          // focusNode: emailFocus,
                          fontColor: Colors.black,
                          textFieldColor: Colors.purple,
                          borderColor: Colors.grey,
                          fillColor: Colors.white,
                          // formKey: emailFormFieldState,
                          onSubmitted: (trim) => {
                            // if (emailFormFieldState.currentState.validate())
                            //   {
                            //     AppUtils().fieldFocusChange(
                            //         context, emailFocus, passwordFocus)
                            //   }
                          }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
