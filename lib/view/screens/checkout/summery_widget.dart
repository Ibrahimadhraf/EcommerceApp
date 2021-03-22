import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/helpers/application_colors.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/widgets/custome_text.dart';
import 'package:online_shopping/view/widgets/horizontal_space.dart';
import 'package:online_shopping/view/widgets/vertical_space.dart';
import 'package:online_shopping/viewmodel/card_viewmodel.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
        child: GetBuilder<CardViewModel>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HorizontalSpace(
            space: SizeConfig().safeBlockVertical * 4,
          ),
          Container(
            height: SizeConfig().screenHeight * .4,
            padding: EdgeInsets.all(SizeConfig().safeBlockVertical * 2),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.cardList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: SizeConfig().safeBlockHorizontal * 30,
                    height: SizeConfig().safeBlockHorizontal * 25,
                    child: Column(
                      children: [
                        Image.network(
                          controller.cardList[index].image,
                          fit: BoxFit.fitWidth,
                        ),
                        HorizontalSpace(
                          space: SizeConfig().safeBlockVertical * 3,
                        ),
                        RichText(
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          text: TextSpan(text: controller.cardList[index].name ,
                          style: TextStyle(color: Colors.black)),
                        ),
                        HorizontalSpace(
                          space: SizeConfig().safeBlockVertical * 3,
                        ),
                        CostumeText(
                          text: "\$ ${controller.cardList[index].price}",
                          color: ApplicationColors().primaryColor,
                        ),
                      ],
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) =>VerticalSpace(
              space: SizeConfig().safeBlockVertical * 2,
            ),),
          )
        ],
      ),
    ));
  }
}
