import 'package:flutter/material.dart';
import 'package:Auto_Shop/features/home/data/product_model.dart';
import 'package:Auto_Shop/features/home/view/widgets/drawer.dart';
import 'package:Auto_Shop/features/home/view/widgets/product_card.dart';
import 'package:Auto_Shop/generated/l10n.dart';

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
                    background: Theme.of(context).primaryColor,
                    radius: 20,
                    width: 300,
                    fontFamily: "ProtestRiot-Regular",
                    text:
                        "${S.of(context).total_text} $totalPrice ${S.of(context).EGP} ${S.of(context).check_out_text}",
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
