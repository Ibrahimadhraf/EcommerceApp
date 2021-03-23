import 'package:online_shopping/model/card_product_model.dart';

class OrderModel{
  String userId ,dateTime;
List<CardProductModel> productModel;
Address address;

  OrderModel({this.userId, this.dateTime, this.productModel ,this.address});
factory  OrderModel.fromJson(Map<String ,dynamic> map){
    return OrderModel(
      userId: map['userId'] ,
      dateTime:  map['dateTime'] ,
      productModel: map['productModel'] ,
      address: map['address']
    );
  }
  Map<String ,dynamic> toJson(){
    return {
      'userId':this.userId,
      'dateTime':this.dateTime,
      'productModel':this.productModel,

      'address':this.address

    };
  }
}
class Address{
  String street1,street2 ,city,state,country;

  Address({this.street1, this.street2, this.city, this.state, this.country});
  factory Address.fromJson(Map<String ,dynamic> map){
    return Address(
      street1:  map['street1'] as String ,
      street2: map['street2'] as String ,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
    );

  }
 Map<String ,dynamic> toJson(){
   return {
     'street1':this.street1,
     'street2':this.street2,
     'city':this.city,
     'state':this.city,
     'country':this.country

   };
 }
}