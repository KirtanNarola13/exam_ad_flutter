import 'package:exam_ad_flutter/screen/cart/controller/remove_controller.dart';
import 'package:exam_ad_flutter/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RemoveController controller = Get.put(RemoveController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getMyProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<CartModel>? data = snapshot.data;
            return GetBuilder<RemoveController>(
              builder: (controller) => ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          title: Text(data[index].name),
                          subtitle: Text(data[index].price),
                          trailing: IconButton(
                            onPressed: () {
                              DBHelper.dbHelper
                                  .deleteProduct(title: data[index].name);
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
