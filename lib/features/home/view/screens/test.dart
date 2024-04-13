import 'package:flutter/material.dart';
import '../../../../core/utils/functions.dart';
import '../../../payment_feature/view/screens/my_card_view.dart';
import '/../features/home/manager/cubits/order/order_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/button.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: defaultButton(
              text: "finish",
              fontSize: 20,
              onPressed: () {
                OrderCubit.get(context).finishOrder();
                pushNavigate(context, MyCartView());
              },
            ),
          ),
        );
      },
    );
  }
}
