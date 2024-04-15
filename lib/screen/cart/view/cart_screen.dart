import 'package:exam_ad_flutter/utils/db_helper.dart';
import 'package:flutter/material.dart';

import '../../../model/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DBHelper.dbHelper.getMyTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<CartModel>? data = snapshot.data;
            return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child: ListTile(
                      title: Text(data[index].name),
                    )),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
