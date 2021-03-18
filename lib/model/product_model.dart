import 'package:flutter/material.dart';
import 'package:online_shopping/view/helpers/extenstion.dart';

class ProductModel{
  String name ,image ,description,size ,price ,productID;
    Color   color;


  ProductModel({this.name, this.image, this.description, this.color, this.size,
      this.price ,this.productID});
  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
     productID=map['id'];
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    price = map['price'];
  }

  toJson() {
    return {
      'id':productID,
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
    };
  }
}