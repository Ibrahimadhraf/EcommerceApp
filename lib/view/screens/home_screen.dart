import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/helpers/application_colors.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/screens/details_screens.dart';
import 'package:online_shopping/view/widgets/common_text_controller.dart';
import 'package:online_shopping/view/widgets/custome_text.dart';
import 'package:online_shopping/view/widgets/horizontal_space.dart';
import 'package:online_shopping/view/widgets/vertical_space.dart';
import 'package:online_shopping/viewmodel/home_view_model.dart';




class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller)=>
        Scaffold(

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: SizeConfig().safeBlockVertical * 10,
                left: SizeConfig().safeBlockVertical * 2,
                right: SizeConfig().safeBlockVertical * 2),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200),
                  child: CommonTextControllers.customTextField(
                      fontColor: Colors.black,
                      textFieldColor: Colors.purple,
                      isObscureText: false,
                      prefix: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                ),
                HorizontalSpace(
                  space: SizeConfig().safeBlockVertical * 4,
                ),

                Container(
                  alignment: Alignment.topLeft,
                    child: CostumeText(text:'Categories' ,fontSize: SizeConfig().fontSize14,)),
                HorizontalSpace(
                  space: SizeConfig().safeBlockVertical * 4,
                ),
                Container(
                  height: SizeConfig().screenHeight*.20,
                  child: ListView.separated(
                    itemCount: controller.categoryModel.length,
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context ,index){
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100,
                          ),
                          height:SizeConfig().safeBlockVertical*8,
                            width:SizeConfig().safeBlockVertical*8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(controller.categoryModel[index].image ,
                              ),
                            ),

                        ),
                        HorizontalSpace(
                          space: SizeConfig().safeBlockVertical * 3,
                        ),
                        CostumeText(text: controller.categoryModel[index].name,)
                      ],
                    );
                  }, separatorBuilder: ( context, index) =>VerticalSpace(space:  SizeConfig().safeBlockVertical * 3,),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CostumeText(text:'Best Selling' ,fontSize: SizeConfig().fontSize15,),
                    CostumeText(text:'See all' ,fontSize: SizeConfig().fontSize15,)
                  ],
                ),
                HorizontalSpace(
                  space: SizeConfig().safeBlockVertical * 3,
                ),
                Container(
                  height: SizeConfig().safeBlockVertical*37,
                  child: ListView.separated(
                    itemCount: controller.productModel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context ,index){
                      return GestureDetector(
                        onTap: (){
                          print(controller.productModel[index].productID);
                          Get.to(()=>DetailsScreens(
                            model:controller.productModel[index]
                          ));

                        },
                        child: Container(

                          height:SizeConfig().safeBlockVertical*8,
                          width:SizeConfig().screenWidth*.4,
                          child: Column(
                            children: [
                              Container(
                                height:SizeConfig().blockSizeVertical*25 ,
                                  child:

                              Image.network(controller.productModel[index].image ,
                                fit: BoxFit.cover,),

                        ),
                              HorizontalSpace(
                                space: SizeConfig().safeBlockVertical * .8,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child:
                                CostumeText(text: controller.productModel[index].name, )),
                              ),
                              HorizontalSpace(
                                space: SizeConfig().safeBlockVertical * .8,
                              ),


                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child:
                                    CostumeText(text:controller.productModel[index].price +" \$ ",
                                    color: ApplicationColors().primaryColor,)),
                              ),

                            ],
                          )),
                      );
                    }, separatorBuilder: ( context, index) =>VerticalSpace(space:  SizeConfig().safeBlockVertical * 3,),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


