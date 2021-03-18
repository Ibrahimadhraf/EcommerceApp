import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/helpers/application_colors.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/widgets/custome_text.dart';
import 'package:online_shopping/view/widgets/horizontal_space.dart';
import 'package:online_shopping/view/widgets/vertical_space.dart';
import 'package:online_shopping/viewmodel/card_viewmodel.dart';

class CardScreen extends StatelessWidget {
  final List<String> names = ['men', '2', '3', '4', '5'];
  final List<String> name = [
    'images/Image.png',
    'images/Image.png',
    'images/Image.png',
    'images/Image.png',
    'images/Image.png',
  ];
  final List<int> price = [100, 200, 300, 400, 500];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        GetBuilder<CardViewModel>(
          init:  Get.find(),
          builder: (controller) => Expanded(
            child: Container(
              child: ListView.separated(
                itemCount: controller.cardList.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: SizeConfig().safeBlockHorizontal * 30,
                      child: Row(
                        children: [
                          Container(
                              width: SizeConfig().safeBlockHorizontal * 30,
                              child: Image.network(
                                controller.cardList[index].image,
                                fit: BoxFit.fill,
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig().safeBlockHorizontal * 5),
                            child: Column(
                              children: [
                                CostumeText(
                                  text: controller.cardList[index].name,
                                  fontSize: SizeConfig().fontSize16,
                                ),
                                HorizontalSpace(
                                  space: SizeConfig().safeBlockVertical * 2,
                                ),
                                CostumeText(
                                  text: "\$" +
                                      controller.cardList[index].price
                                          .toString(),
                                  color: ApplicationColors().primaryColor,
                                ),
                                HorizontalSpace(
                                  space: SizeConfig().safeBlockVertical * 5,
                                ),
                                Container(
                                  width: SizeConfig().safeBlockVertical * 15,
                                  height: SizeConfig().safeBlockVertical * 4,
                                  color: Colors.grey.shade200,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(

                                        child: Icon(
                                          Icons.add_circle,
                                          color: Colors.black,
                                        ),
                                        onTap: (){
                                          controller.increaseQuantity(index);
                                        },
                                      ),
                                      VerticalSpace(
                                        space:
                                            SizeConfig().safeBlockVertical * 2,
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          child: CostumeText(
                                            text: '${controller.cardList[index].quantity}',
                                          )),
                                      VerticalSpace(
                                        space:
                                            SizeConfig().safeBlockVertical * 2,
                                      ),
                                      GestureDetector(
                                        child:  Icon(
                                          Icons.remove_circle,
                                          color: Colors.black,

                                        ),
                                        onTap: (){
                                          print('tttttt');
                                        controller.cardList[index].quantity!=0?  controller.decreaseQuantity(index): print('tttttt');
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ));
                },
                separatorBuilder: (context, int index) {
                  return HorizontalSpace(
                    space: SizeConfig().safeBlockVertical * 4,
                  );
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(SizeConfig().safeBlockHorizontal * 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CostumeText(
                    text: 'Total',
                    fontSize: SizeConfig().fontSize16,
                    color: Colors.grey,
                  ),
                  GetBuilder<CardViewModel>(
                    init: Get.find(),
                      builder: (controller) => CostumeText(
                          text: " \$" + "${controller.totalPrice}",
                          color: ApplicationColors().primaryColor,
                          fontSize: SizeConfig().fontSize16)),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Center(
                      child: CostumeText(
                    text: 'CHECKOUT',
                    color: Colors.white,
                  )),
                  decoration: BoxDecoration(
                    color: ApplicationColors().primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: SizeConfig().safeBlockHorizontal * 28,
                  height: SizeConfig().safeBlockHorizontal * 8,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
