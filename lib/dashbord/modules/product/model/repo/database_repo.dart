import 'package:case_study/dashbord/modules/product/model/entity_model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseRepo{
 late Database myObjectDB;
  Future<void> initDB() async{
   myObjectDB=await openDatabase(
      (await getDatabasesPath()) + '/product.db',
      version: 1,
      onCreate: (db, version) async {
       await db.execute('''
CREATE TABLE product (
  id INTEGER PRIMARY KEY,
   name TEXT NOT NULL, 
   description TEXT,
   image BLOB, quantity INTEGER, availableQuantity INTEGER, favorite INTEGER, cart INTEGER)'''  
        );
      },
    );
  }
Future<void> insertproduct(
  String name, String desc, int quantity, int availableQuantity, Uint8List image
) async {
await myObjectDB.insert('product', {
    'name':name,
    'description':desc,
    'quantity':quantity,
    'av/ailableQuantity':availableQuantity,
   'image':image,
    'favorite':0,
    'cart':0,
 });
}
Future<List<ProductModel>> fetchfavoriteProducts() async{
return  (await myObjectDB.query('product',where: 'favorite=?',whereArgs: [1])).map((e) => ProductModel.fromJson(e)).toList();
}
Future<List<ProductModel>> fetchProducts() async{
return  (await myObjectDB.query('product')).map((e) => ProductModel.fromJson(e)).toList();
}
Future<List<ProductModel>> fetchcartProducts() async{
return  (await myObjectDB.query('product',where: 'cart=?',whereArgs: [1])).map((e) => ProductModel.fromJson(e)).toList();
}
void newQuantity(int qnt, int id){
myObjectDB.update('product',{
  'availableQuantity':qnt,
}, where: 'id=?',whereArgs: [id]);
}
void updateCart(int value, int id){
  myObjectDB.update('product', {'cart':value,},where: 'id=?',whereArgs: [id]);
}
void updateFavorite(int value, int id){
  myObjectDB.update('product', {'favorite':value,},where: 'id=?',whereArgs: [id]);
}
void deleteproduct( int id){
  myObjectDB.delete('product', where: 'id=?',whereArgs: [id]);
}
}