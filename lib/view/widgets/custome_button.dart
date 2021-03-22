

import 'package:flutter/material.dart';
import 'package:online_shopping/view/helpers/application_colors.dart';
import 'package:online_shopping/view/widgets/custome_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  final Function onPress;

  CustomButton({
    @required this.onPress,
    this.text = 'Write text ',
    this.color ,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10),
      onPressed: onPress,
      color:ApplicationColors(). primaryColor,
      child: Container(
        alignment: Alignment.center ,
        child: CostumeText(
          text: text,
          color: Colors.white,
        ),
      ),
    );
  }
}