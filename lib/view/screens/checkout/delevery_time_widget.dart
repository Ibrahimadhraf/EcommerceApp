import 'package:flutter/material.dart';
import 'package:online_shopping/view/helpers/application_colors.dart';
import 'package:online_shopping/view/helpers/enum.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/widgets/custome_text.dart';
import 'package:online_shopping/view/widgets/horizontal_space.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery=Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
        child: Column(
      children: [
        HorizontalSpace(
          space: SizeConfig().safeBlockVertical * 4,
        ),
        RadioListTile<Delivery>(
          value: Delivery.StandardDelivery,
          groupValue: delivery,
          onChanged: ( Delivery value) {
            setState(() {
              delivery=value;
            });
          },
          title: CostumeText(
            text: 'Standard Delivery',
            fontSize: SizeConfig().fontSize16,
          ),
          subtitle: CostumeText(
              text: 'Order will be delivered between 3 -5  business days',
              fontSize: SizeConfig().fontSize14),
          activeColor: ApplicationColors().primaryColor,
        ),
        HorizontalSpace(
          space: SizeConfig().safeBlockVertical * 4,
        ),
        RadioListTile<Delivery>(
          value: Delivery.NextDayDelivery,
          groupValue: delivery,
          onChanged: ( Delivery value) {
            setState(() {
              delivery=value;
            });
          },
          title: CostumeText(
            text: 'Next Day Delivery',
            fontSize: SizeConfig().fontSize16,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: CostumeText(
                text: 'Place your order before 6pm and your items will be delivered next day ',
                maxLine: 2,
                fontSize: SizeConfig().fontSize14),
          ),
          activeColor: ApplicationColors().primaryColor,
        ),
        HorizontalSpace(
          space: SizeConfig().safeBlockVertical * 4,
        ),
        RadioListTile<Delivery>(
          value: Delivery.NominatedDelivery,
          groupValue: delivery,
          onChanged: ( Delivery value) {
            setState(() {
              delivery=value;
            });
          },
          title: CostumeText(
            text: 'Nominated Delivery',
            fontSize: SizeConfig().fontSize16,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: CostumeText(
                text: 'Pick the  particular date  from the calender and order will be delivered in selected date ',
                fontSize: SizeConfig().fontSize14 ,
            maxLine: 2,),
          ),
          activeColor: ApplicationColors().primaryColor,
        ),
      ],
    ));
  }
}
