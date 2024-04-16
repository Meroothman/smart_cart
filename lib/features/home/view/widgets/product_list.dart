import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/home/data/product_model.dart';
import 'package:smart_cart_payment_project/features/home/view/widgets/drawer.dart';
import 'package:smart_cart_payment_project/features/home/view/widgets/product_card.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions.dart';

// ignore: must_be_immutable
class ProductList extends StatelessWidget {
  ProductList({
    super.key,
    required this.productList,
    required this.totalPrice,
  });

  final List<ProductModel> productList;
  int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                cancelOrder(context);
              },
              icon: const Icon(Icons.delete_outline_outlined)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        productName: productList[index].productName,
                        productImage: productList[index].url,
                        productPrice: productList[index].price,
                        productQuantity: productList[index].userQuantity,
                      );
                    }),
                Positioned(
                  bottom: 50,
                  left: 20,
                  right: 20,
                  child: defaultButton(
                    radius: 20,
                    width: 300,
                    fontFamily: "ProtestRiot-Regular",
                    text: "total: $totalPrice EGP       Checkout >",
                    fontSize: 20,
                    onPressed: () {
                      finishOrder(context, totalPrice);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
