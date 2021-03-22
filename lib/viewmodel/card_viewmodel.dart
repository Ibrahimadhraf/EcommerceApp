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
  var _totalPrice=RxDouble(0.0) ;
  double get totalPrice => _totalPrice.value;



  // @override
  // void onInit() {
  //   super.onInit();
  //   getAllProducts();
  //   update();
  //
  // }

  getAllProducts() async {

    _loading.value = true;

    await dbHelper.getAllProducts().then((value){
      _cardList=value;
      _loading.value = false;
      print('call_1');
      getTotalPrice();
      print('call_2');
      update();
    });







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

    _totalPrice.value=0;
    print('test');
    for (var card in _cardList) {
      print(card.toJson());
      _totalPrice.value += (double.parse(card.price) * card.quantity);



      print( "totalPrice $totalPrice");
      update();
    }

  }
  increaseQuantity(int index) async{
   _cardList[index].quantity++;
   _totalPrice.value+= (double.parse(_cardList[index].price));
    await dbHelper.updateProduct(_cardList[index]);
   update();

  }
  decreaseQuantity(int index) async{
    print('clicked');
    _cardList[index].quantity--;
    print(_cardList[index].quantity);
    _totalPrice.value-= (double.parse(_cardList[index].price));
   await  dbHelper.updateProduct(_cardList[index]);
    update();

  }
}
