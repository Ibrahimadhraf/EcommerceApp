import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/model/card_product_model.dart';
import 'package:online_shopping/service/database/card_database_helper.dart';

class CardViewModel extends GetxController {
  List<CardProductModel> _cardList = [];

  List<CardProductModel> get cardList => _cardList;

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  var dbHelper = CartDatabaseHelper.db;
  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }

  getAllProducts() async {
    _loading.value = true;

    _cardList = await dbHelper.getAllProducts();

    _loading.value = false;
    getTotalPrice();
    update();
    print(_cardList.length);

  }

  addProduct(CardProductModel productModel) async {
    for (int i = 0; i < _cardList.length; i++) {
      if (_cardList[i].id==productModel.id) {
        print('222222');
        return;
      }
    }

    await dbHelper.inset(productModel);
    _cardList.add(productModel);
    print('5555555555');
    print(productModel.id);

    update();

  }

  getTotalPrice() {
    for (int i = 0; i <= _cardList.length; i++) {
      print(_cardList.length);
      _totalPrice += (double.parse(_cardList[i].price)) * _cardList[i].quantity;
      print( "totalPrice $_totalPrice");
    }
    update();
  }
  increaseQuantity(int index) async{
   _cardList[index].quantity++;
   _totalPrice+= (double.parse(_cardList[index].price));
    await dbHelper.updateProduct(_cardList[index]);
   update();

  }
  decreaseQuantity(int index) async{
    print('clicked');
    _cardList[index].quantity--;
    print(_cardList[index].quantity);
    _totalPrice-= (double.parse(_cardList[index].price));
   await  dbHelper.updateProduct(_cardList[index]);
    update();

  }
}
