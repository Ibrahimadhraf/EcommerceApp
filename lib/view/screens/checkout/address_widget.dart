import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/helpers/app_utils.dart';
import 'package:online_shopping/view/helpers/application_colors.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/widgets/common_text_controller.dart';
import 'package:online_shopping/view/widgets/custome_text.dart';
import 'package:online_shopping/view/widgets/horizontal_space.dart';
import 'package:online_shopping/viewmodel/checkout_viewmodel.dart';

class AddAddress extends StatelessWidget {

  final street1Focus = FocusNode();
  final street2Focus = FocusNode();
  final stateFocus = FocusNode();
  final countryFocus = FocusNode();
  final cityFocus=FocusNode();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<CheckOutViewModel>(
      init: Get.find(),
      builder:(controller)=> Expanded(
        child: SingleChildScrollView(
          child: Form(
            key: controller.addressFormFieldState,
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
                      if (value.isEmpty) return "You must write your street!";

                      else
                        return null;
                    },
                    labelText: 'Street1',
                    hint: '21 Alex Davidson Avenue',
                    onSave: (value){
                      controller.street1=value;
                      print(value);
                    },
                    height: SizeConfig().safeBlockVertical * 7,
                    isObscureText: false,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: ApplicationColors().primaryColor),
                    ),
                    // controller: emailTextEditingController,
                    keyboardType: TextInputType.text,
                     focusNode: street1Focus,
                    fontColor: Colors.black,
                    textFieldColor: Colors.purple,
                    borderColor: Colors.grey,
                    fillColor: Colors.white,
                    // formKey: emailFormFieldState,
                    onSubmitted: (trim)  {

                              AppUtils().fieldFocusChange(
                                  context, street1Focus, street2Focus);

                        }),
                HorizontalSpace(
                  space: SizeConfig().safeBlockVertical * 4,
                ),
                CommonTextControllers.customTextField(
                    maxLines: 1,
                    validator: (value) {
                      if (value.isEmpty) return "You must write your street!";

                        return null;
                    },
                    onSave: (value){
                      controller.street2=value;
                      print(value);
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
                     focusNode: street2Focus,
                    fontColor: Colors.black,
                    textFieldColor: Colors.purple,
                    borderColor: Colors.grey,
                    fillColor: Colors.white,
                    // formKey: emailFormFieldState,
                    onSubmitted: (trim) {

                          AppUtils().fieldFocusChange(
                              context, street2Focus, cityFocus);

                    }),
                HorizontalSpace(
                  space: SizeConfig().safeBlockVertical * 4,
                ),
                CommonTextControllers.customTextField(
                    maxLines: 1,
                    validator: (value) {
                      if (value.isEmpty) return "You must write your street!";

                      return null;
                    },
                    onSave: (value){
                      controller.city=value;
                      print(value);
                    },
                    labelText: 'city',

                    height: SizeConfig().safeBlockVertical * 7,
                    isObscureText: false,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: ApplicationColors().primaryColor),
                    ),
                    // controller: emailTextEditingController,
                    keyboardType: TextInputType.text,
                     focusNode: cityFocus,
                    fontColor: Colors.black,
                    textFieldColor: Colors.purple,
                    borderColor: Colors.grey,
                    fillColor: Colors.white,
                    // formKey: emailFormFieldState,
                    onSubmitted: (trim) {

                        AppUtils().fieldFocusChange(
                            context, cityFocus, stateFocus);

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
                                if (value.isEmpty) return "Your State not be empty!";

                                else
                                  return null;
                              },
                              labelText: 'State',
                                onSave: (value){
                                  controller.state=value;
                                  print(value);
                                },
                              height: SizeConfig().safeBlockVertical * 7,
                              isObscureText: false,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(color: ApplicationColors().primaryColor),
                              ),
                              // controller: emailTextEditingController,
                              keyboardType: TextInputType.text,
                               focusNode: stateFocus,
                              fontColor: Colors.black,
                              textFieldColor: Colors.purple,
                              borderColor: Colors.grey,
                              fillColor: Colors.white,
                              // formKey: emailFormFieldState,
                              onSubmitted: (trim) => {

                                    AppUtils().fieldFocusChange(
                                        context, stateFocus, countryFocus)

                              }),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right:20.0),
                          child: CommonTextControllers.customTextField(
                              maxLines: 1,
                              validator: (value) {
                                if (value.isEmpty) return "Country can not be empty!";

                                  return null;
                              },
                              labelText: 'Country',
                              onSave: (value){
                                controller.country=value;
                                print(value);
                              },
                              height: SizeConfig().safeBlockVertical * 7,
                              isObscureText: false,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(color: ApplicationColors().primaryColor),
                              ),
                              // controller: emailTextEditingController,
                              keyboardType: TextInputType.text,
                               focusNode: countryFocus,
                              fontColor: Colors.black,
                              textFieldColor: Colors.purple,
                              borderColor: Colors.grey,
                              fillColor: Colors.white,
                              // formKey: emailFormFieldState,
                              onSubmitted: (trim) => {

                                    FocusScope.of(context).requestFocus(FocusNode())

                              }),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
