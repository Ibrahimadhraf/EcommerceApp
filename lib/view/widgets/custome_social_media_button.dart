import 'package:flutter/material.dart';
import 'package:online_shopping/view/helpers/size_config.dart';

import 'custome_text.dart';
import 'vertical_space.dart';

class CostumeSocialMediaButton extends StatelessWidget {
  final Function onPress;
  final String imageBath;
  final String text;

  CostumeSocialMediaButton({this.onPress, this.imageBath, this.text});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPress,
      child: Container(height: SizeConfig().safeBlockVertical*5,
        decoration: new BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(SizeConfig().safeBlockVertical*2)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(imageBath),
              VerticalSpace(space: SizeConfig().safeBlockVertical * 10,),
              CostumeText(text: text, fontSize: SizeConfig().fontSize15,),

            ],
          ),
        ),
      ),
    );
  }
}
