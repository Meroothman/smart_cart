import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Auto_Shop/features/payment_feature/data/repos/ckeckout_repo_impl.dart';
import 'package:Auto_Shop/features/payment_feature/manger/payment_cubit.dart';
import 'package:Auto_Shop/features/payment_feature/view/widgets/payment_widgets/cart_info_item.dart';
import 'package:Auto_Shop/features/payment_feature/view/widgets/payment_widgets/payment_methods_bottom_sheet.dart';
import 'package:Auto_Shop/features/payment_feature/view/widgets/payment_widgets/total_price_widget.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../../generated/l10n.dart';
//import '../../../../home/manager/cubits/order/order_cubit.dart';

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
          Expanded(child: Image.asset('assets/images/cart.png')),
          const SizedBox(
            height: 25,
          ),
          OrderInfoItem(
            title: S.of(context).order_info_item_title,
            value: "${Constants.totalPrice}  ${S.of(context).EGP}",

            //"\$${OrderCubit.get(context).orderModel!.totalPrice} ",
          ),
          const SizedBox(
            height: 3,
          ),
          OrderInfoItem(
            title: S.of(context).order_discount_title,
            value: ' 0  ${S.of(context).EGP}',
          ),
          const SizedBox(
            height: 3,
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          TotalPrice(
            title: S.of(context).total_price,
            value: "${Constants.totalPrice} ${S.of(context).EGP}",
            //"\$${OrderCubit.get(context).orderModel!.totalPrice} "
          ),
          const SizedBox(
            height: 16,
          ),
          defaultButton(
            onPressed: () {
              /*Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                 return const PaymentDetailsView();
               }));*/
              showModalBottomSheet(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckOutRepoImpl()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
            text: S.of(context).check_out_title,
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
