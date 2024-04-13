import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_cart_payment_project/core/widgets/button.dart';
import 'package:smart_cart_payment_project/features/payment_feature/data/repos/ckeckout_repo_impl.dart';
import 'package:smart_cart_payment_project/features/payment_feature/manger/payment_cubit.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/paymentwidgets/cart_info_item.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/paymentwidgets/payment_methods_bottom_sheet.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/paymentwidgets/total_price_widget.dart';
class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/basket_image_3.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Total Price',
            value: r'42.97$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'0$',
          ),
          const SizedBox(
            height: 3,
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(title: 'Total', value: r'42.97$'),
          const SizedBox(
            height: 16,
          ),
          defaultButton(
            onPressed: () {
              /*Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                 return const PaymentDetailsView();
               }));*/
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  builder: (context) {
                    return  BlocProvider(
                      create: (context) => PaymentCubit(CheckOutRepoImpl()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
            text: 'Complete CheckOut',
            fontSize: 25,
            radius: 15,
            height: 60,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
