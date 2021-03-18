
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shopping/view/helpers/size_config.dart';

class CommonTextControllers {
  static Widget customTextField(
      {TextEditingController controller,
         Function validator,
        Function onSave,
        String labelText,
        Widget suffix,
        Widget prefix,
        bool isObscureText,
        double height,
        double width,
        BorderRadius borderRadius,
        double fontSize,
        Color textFieldColor,
        Color fontColor,
        Color borderColor,
        Color fillColor,
        int maxLines,
        Function onChanged,
        VoidCallback onPrefixPressVCL,
        VoidCallback onSuffixPressVCL,
        TextInputType keyboardType,
        FontWeight fontWeight,
        TextStyle hintStyle,
        EdgeInsets containerPadding,
        enabledBorder,
        focusedBorder,
        GlobalKey<FormFieldState> formKey,
        FocusNode focusNode,
        Function onSubmitted,
       String language,

        List<TextInputFormatter> inputFormatter}) {
    return Container(
      width: width ?? SizeConfig().safeBlockHorizontal * 85,
      alignment: Alignment.center,

      margin: containerPadding ??
          EdgeInsets.symmetric(horizontal: SizeConfig().safeBlockHorizontal * 2),
      child: TextFormField(
        inputFormatters: inputFormatter,
        key: formKey,
        cursorColor: Colors.black,
        validator: validator,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: isObscureText ?? true,
        controller: controller,
        maxLines: maxLines ?? 1,
        textInputAction: TextInputAction.next,

        textAlign: language=='ar'? TextAlign.end:TextAlign.start,
        style:  TextStyle(
            //color: AppColors.blue
        ),
        onChanged: onChanged,
        focusNode: focusNode,
        onSaved: onSave,
        onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
          contentPadding: EdgeInsets.all(SizeConfig().safeBlockHorizontal * 1),
          border: InputBorder.none,
          labelText: labelText ?? '',
              labelStyle:TextStyle(
                color:Colors.grey.shade900,
               // fontWeight: FontWeight.bold,
                fontSize: SizeConfig().fontSize15,
              ),
          fillColor: fillColor,
          suffixIcon: suffix != null
              ? GestureDetector(
              onTap: onSuffixPressVCL,
              child: Padding(
                padding: EdgeInsets.all(SizeConfig().safeBlockHorizontal * 0),
                child: suffix,
              ))
              : Container(
            width: 0,
            height: 0,
          ),
          prefixIcon: prefix != null
              ? GestureDetector(onTap: onPrefixPressVCL, child: prefix)
              : Container(
            width: 0,
            height: 0,
          ),



          focusedBorder: focusedBorder ??
              OutlineInputBorder(
               borderRadius: BorderRadius.zero,
               borderSide: BorderSide(color: Colors.transparent),

              ),
          hintStyle: hintStyle ??
              TextStyle(

               // color: fontColor ?? AppColors.blue,
                fontSize: fontSize ?? SizeConfig().fontSize20,
                fontWeight: fontWeight ?? FontWeight.w400,
              ),
          errorMaxLines: 2,
          errorStyle:
          TextStyle(

              //color: AppColors.red,
              fontSize: SizeConfig().fontSize12),
          errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              borderSide: BorderSide(
                color: Colors.teal,
              )),
        ),
      ),
    );
  }
}