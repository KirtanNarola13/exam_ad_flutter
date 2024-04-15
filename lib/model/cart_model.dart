class CartModel {
  int? id;
  String name;
  String price;

  CartModel({required this.name, required this.price, this.id});

  factory CartModel.fromDB({required Map<String, dynamic> data}) {
    return CartModel(
      id: data['id'],
      name: data['name'],
      price: data['price'],
    );
  }
}
