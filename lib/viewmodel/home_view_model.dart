import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/model/category_model.dart';
import 'package:online_shopping/model/product_model.dart';
import 'package:online_shopping/service/home_service.dart';
import 'package:online_shopping/view/helpers/size_config.dart';
import 'package:online_shopping/view/screens/home_screen.dart';

import 'control_view_model.dart';

class HomeViewModel extends GetxController{
  ValueNotifier<bool> get loading=> _loading;
  ValueNotifier<bool>_loading=ValueNotifier(false);
  List<CategoryModel>  get categoryModel=>_categoryModel;
  List<CategoryModel> _categoryModel=[];

  List<ProductModel>  get productModel=>_productModel;
  List<ProductModel> _productModel=[];
  @override
  void onInit() {
    super.onInit();
    getCategory();
    getBestSellingProducts();
  }

  getCategory()async{
    _loading.value=true;
HomeService().getCategory().then((value) {
      for (int i=0; i<value.length;i++){
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        print(_categoryModel.length);
        _loading.value=false;
      }

      update();

    });
  }
  getBestSellingProducts()async{
    _loading.value=true;
    HomeService().getBestSelling().then((value) {
      for(int i=0;i<value.length;i++){
        print(value[i].data());
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value=false;
      }

    update();
    });
  }


}