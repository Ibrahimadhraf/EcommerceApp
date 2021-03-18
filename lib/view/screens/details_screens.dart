import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/model/card_product_model.dart';
import 'package:online_shopping/model/product_model.dart';
import 'package:online_shopping/view/helpers/application_colors.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/widgets/custome_text.dart';
import 'package:online_shopping/view/widgets/horizontal_space.dart';
import 'package:online_shopping/viewmodel/card_viewmodel.dart';


class DetailsScreens extends StatelessWidget {
 final ProductModel model;

  DetailsScreens({this.model});

  @override
  Widget build(BuildContext context) {
    print(model.image);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: SizeConfig().screenHeight*.4,
              width: SizeConfig().screenWidth,
              child: Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ),
            HorizontalSpace(
              space: SizeConfig().safeBlockVertical * 1,
            ),
            Expanded(

              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CostumeText(text: model.name,
                      fontSize: SizeConfig().fontSize17,),
                      HorizontalSpace(
                        space: SizeConfig().safeBlockVertical * 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Container(
                             padding: EdgeInsets.all(SizeConfig().safeBlockVertical*2),
                             width: SizeConfig().screenWidth*.40,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               border: Border.all(color: Colors.grey)
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 CostumeText(text:'Size'),
                                 CostumeText(text:model.size??''),
                               ],
                             ),
                           ),
                          Container(
                            padding: EdgeInsets.all(SizeConfig().safeBlockVertical*2),
                            width: SizeConfig().screenWidth*.40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CostumeText(text:'Color'),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(SizeConfig().safeBlockHorizontal*4),
                                      border: Border.all(color: Colors.grey),
                                    color: model.color,
                                  ),

                                  width: SizeConfig().safeBlockHorizontal*7,
                                  height: SizeConfig().safeBlockHorizontal*5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      HorizontalSpace(
                        space: SizeConfig().safeBlockVertical * 1,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: CostumeText(text: 'Details',
                          fontSize: SizeConfig().fontSize16,),
                      ),
                      HorizontalSpace(
                        space: SizeConfig().safeBlockVertical * 3,
                      ),
                      CostumeText(
                        text: model.description,
                        maxLine: 6,
                        fontSize:SizeConfig().fontSize14 ,
                        height: 2,
                      )
                    ],
                  ),
                ),
              ),
            ),
             Padding(
               padding:  EdgeInsets.all(SizeConfig().safeBlockHorizontal*10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     children: [
                       CostumeText(text:'PRICE' ,fontSize: SizeConfig().fontSize16,color: Colors.grey,),
                       CostumeText(text:" \$"+ model.price, color: ApplicationColors().primaryColor, fontSize: SizeConfig().fontSize16),

                     ],
                   ),
                   GetBuilder<CardViewModel>(
                     init: Get.find(),
                     builder:(controller) =>GestureDetector(
                       onTap: (){
                         controller.addProduct(
                             CardProductModel(
                                 name: model.name ,
                                 image: model.image ,
                                 price: model.price,

                                 quantity: 1 ,
                               id: model.productID,

                             )
                         );

                       },
                       child: Container(
                         child: Center(child: CostumeText(text: 'ADD', color: Colors.white,)),
                           decoration: BoxDecoration(
                             color: ApplicationColors().primaryColor,
                           borderRadius: BorderRadius.circular(10),),

                         width: SizeConfig().safeBlockHorizontal*28,
                         height: SizeConfig().safeBlockHorizontal*8,

                       ),
                     ),
                   )
                 ],
               ),
             ),

          ],
        ),
      ),
    );
  }
}
