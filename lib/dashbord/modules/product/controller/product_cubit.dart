import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:case_study/dashbord/modules/product/model/entity_model/product_model.dart';
import 'package:case_study/dashbord/modules/product/model/repo/database_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductStateLading()){
    init();
  }

 List<ProductModel> products =[];
 DatabaseRepo repo=DatabaseRepo();

 Future<void> init() async{
emit(ProductStateLading());
await repo.initDB();
await repo.insertproduct('product1', 'desc', 0, 10 , Uint8List(10));
await repo.insertproduct('product2', 'desc2', 0, 20 , Uint8List(10));

products=await repo.fetchProducts();
if(products.isEmpty){
  emit(ProductStateEmpty());
}else{
  emit(ProductStateLoaded());
}

  }
  void addItemToCart(int id){
repo.updateCart(1, id);
emit(ProductStateLoaded());
  }
  void addItemToFavorite(int id,int value){

repo.updateFavorite(value, id);
init();
emit(ProductStateLoaded());
  }
}


