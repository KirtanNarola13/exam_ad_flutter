import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_ad_flutter/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/prodect_model.dart';
import '../../../utils/firestore_helper.dart';
import '../../cart/view/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(
            AlertDialog(
              title: const Center(
                child: Text('Add Product'),
              ),
              content: Container(
                width: 500,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: nameController,
                      onChanged: (val) {
                        nameController.text = val;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: priceController,
                      onChanged: (val) {
                        priceController.text = val;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Price',
                        labelStyle: TextStyle(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {
                        ProductModel product = ProductModel(
                          name: nameController.text,
                          price: priceController.text,
                        );
                        FireStoreHelper.fireStoreHelper.addProduct(product);
                        Get.back();
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
            fontSize: 22,
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const CartScreen());
            },
            icon: Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: StreamBuilder(
          stream: FireStoreHelper.fireStoreHelper.getProducts(),
          builder: (context, snapshot) {
            QuerySnapshot? querySnapshot = snapshot.data as QuerySnapshot?;
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: querySnapshot!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Theme(
                        data: ThemeData()
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(querySnapshot!.docs[index]['name']),
                          subtitle: Text(querySnapshot.docs[index]['price']),
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton.icon(
                                    onPressed: () {
                                      Get.dialog(
                                        AlertDialog(
                                          title: Center(
                                            child: Text('Edit Price'),
                                          ),
                                          content: Container(
                                            width: 500,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  controller: priceController,
                                                  onChanged: (val) {
                                                    priceController.text = val;
                                                  },
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'Price',
                                                    labelStyle: TextStyle(),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.deepPurple,
                                                        width: 5,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                OutlinedButton(
                                                  onPressed: () {
                                                    ProductModel product =
                                                        ProductModel(
                                                            name: querySnapshot
                                                                    .docs[index]
                                                                ['name'],
                                                            price:
                                                                priceController
                                                                    .text);
                                                    FireStoreHelper
                                                        .fireStoreHelper
                                                        .updateProduct(product);
                                                    Get.back();
                                                  },
                                                  child: const Text('update'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    label: const Text('Price'),
                                    icon: const Icon(Icons.edit),
                                  ),
                                  OutlinedButton.icon(
                                    onPressed: () {
                                      ProductModel product = ProductModel(
                                        name: querySnapshot.docs[index]['name'],
                                        price: querySnapshot.docs[index]
                                            ['price'],
                                      );
                                      FireStoreHelper.fireStoreHelper
                                          .deleteProduct(product);
                                    },
                                    label: const Text(
                                      'Delete',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                  OutlinedButton.icon(
                                    onPressed: () {
                                      DBHelper.dbHelper.addToCart(
                                        name: querySnapshot.docs[index]['name'],
                                        price: querySnapshot.docs[index]
                                            ['price'],
                                      );
                                    },
                                    label: const Text(
                                      'Cart',
                                      style: TextStyle(),
                                    ),
                                    icon: const Icon(
                                      Icons.add_shopping_cart_outlined,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
