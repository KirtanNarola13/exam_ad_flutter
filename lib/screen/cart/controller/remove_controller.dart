import 'package:exam_ad_flutter/model/cart_model.dart';
import 'package:exam_ad_flutter/utils/db_helper.dart';
import 'package:get/get.dart';

class RemoveController extends GetxController {
  Future<List<CartModel>?> getMyProduct() async {
    List<CartModel>? myCart = await DBHelper.dbHelper.getMyTasks();
    return myCart;
  }

  Future<int>? removeProduct(String name) {
    DBHelper.dbHelper
        .deleteProduct(title: name)
        .then((value) => getMyProduct());
    update();
    return null;
  }
}
