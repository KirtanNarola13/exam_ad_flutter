import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/prodect_model.dart';

class FireStoreHelper {
  FireStoreHelper._();
  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  addProduct(ProductModel productModel) {
    firestore.collection('products').doc(productModel.name).set({
      'name': productModel.name,
      'price': productModel.price,
    });
  }

  getProducts() {
    return firestore.collection('products').snapshots();
  }

  updateProduct(ProductModel productModel) {
    firestore.collection('products').doc(productModel.name).update({
      'name': productModel.name,
      'price': productModel.price,
    });
  }

  deleteProduct(ProductModel productModel) {
    firestore.collection('products').doc(productModel.name).delete();
  }
}
