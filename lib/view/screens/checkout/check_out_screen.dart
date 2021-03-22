import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/helpers/constants.dart';
import 'package:online_shopping/view/helpers/enum.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/widgets/custome_button.dart';
import 'package:online_shopping/viewmodel/checkout_viewmodel.dart';
import 'package:status_change/status_change.dart';

import 'address_widget.dart';
import 'delevery_time_widget.dart';
import 'summery_widget.dart';

class CheckOutScreen extends StatelessWidget {






@override
Widget build(BuildContext context) {
  return GetBuilder<CheckOutViewModel>(
    init:CheckOutViewModel() ,
    builder:(controller) =>Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "CheckOut",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 100,
            child: StatusChange.tileBuilder(
              theme: StatusChangeThemeData(
                direction: Axis.horizontal,
                connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
              ),
              builder: StatusChangeTileBuilder.connected(
                itemWidth: (_) =>
                MediaQuery.of(context).size.width / _processes.length,
                nameWidgetBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      _processes[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: controller.getColor(index),
                      ),
                    ),
                  );
                },
                indicatorWidgetBuilder: (_, index) {
                  if (index <= controller.index) {
                    return DotIndicator(
                      size: 35.0,
                      border: Border.all(color: Colors.green, width: 1),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return OutlinedDotIndicator(
                      size: 30,
                      borderWidth: 1.0,
                      color: todoColor,
                    );
                  }
                },
                lineWidgetBuilder: (index) {
                  if (index > 0) {
                    if (index == controller.index) {
                      final prevColor = controller. getColor(index - 1);
                      final color = controller. getColor(index);
                      var gradientColors;
                      gradientColors = [
                        prevColor,
                        Color.lerp(prevColor, color, 0.5)
                      ];
                      return DecoratedLineConnector(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors,
                          ),
                        ),
                      );
                    } else {
                      return SolidLineConnector(
                        color:controller. getColor(index),
                      );
                    }
                  } else {
                    return null;
                  }
                },
                itemCount: _processes.length,
              ),
            ),
          ),
          controller. pages == Pages.DeliveryTime
              ? DeliveryTime()
              : controller.pages == Pages.AddAddress
              ? AddAddress()
              : Summary(),

        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(SizeConfig().safeBlockHorizontal*5),
            width: SizeConfig().screenWidth*.5,
            height: SizeConfig().screenWidth*.25 ,
            child: CustomButton(

                onPress: (){

              controller.changeIndex(controller.index+1);
            },
            text: 'Next',),
          ),
        )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.skip_next),
      //   onPressed: () {
      //
      // controller.changeIndex(controller.index+1);
      //   },
      //   backgroundColor: inProgressColor,
      // ),
    ),
  );
}
}

final _processes = [
  'Delivery',
  'Address',
  'Summer',
];

