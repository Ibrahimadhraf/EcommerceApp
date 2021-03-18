class CardProductModel{
  String name ,image ,price ,id;
  int quantity   ;


  CardProductModel({this.name, this.image,  this.quantity,
    this.price ,this.id});
  CardProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity=map['quantity'];
    id=map['id'];

  }
/*
final String tableCardProduct='card product';
final String columnName='name';
final String columnImage='image';
final String columnQuantity='quantity';
final String columnPrice='Price';
 */
  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity':quantity,
      'price': price,
      'id':id,


    };
  }
}