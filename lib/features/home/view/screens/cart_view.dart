import 'package:flutter/material.dart';
import 'package:Auto_Shop/features/home/view/widgets/product_list.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/utils/dialog.dart';
import '/../features/home/manager/cubits/order/order_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'no_product_screen.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderError) {
          CustomSimpleDialog.showCustomDialog(context, "Error", () {
            OrderCubit().retryOrder(context);
          }, "Retry", "Something went wrong , please try again");
        }
      },
      builder: (context, state) {
        if (state is OrderAdded || state is NoProduct) {
          return const NoProductScreen();
        } else if (state is GetProductsSuccess) {
          return ProductList(
            productList: state.products, totalPrice: state.totalPrice,
            // totalPrice: state.totalPrice,
          );
        } else {
          return Scaffold(
              body: Center(
            child: LoadingAnimationWidget.beat(
              color: Theme.of(context).primaryColor,
              size: 200,
            ),
          ));
        }
      },
    );
  }
}
