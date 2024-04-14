import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/failure_screen.dart';
import 'package:smart_cart_payment_project/features/home/view/widgets/product_list.dart';
import '../../../../core/utils/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '/../features/home/manager/cubits/order/order_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'no_product_screen.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OrderReloading) {
          return Scaffold(
              body: Center(
            child: LoadingAnimationWidget.beat(
              color: Constants.primaryColor,
              size: 200,
            ),
          ));
        } else if (state is OrderLoading || state is OrderAdded) {
          return const NoProductScreen();
        } else if (state is GetProductsSuccess) {
          return ProductList(
            productList: state.products,
            totalPrice: state.totalPrice,
          );
        } else {
          return const FailureScreen();
        }
      },
    );
  }
}
