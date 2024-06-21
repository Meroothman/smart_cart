import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_cart_payment_project/core/utils/constants.dart';
import 'package:smart_cart_payment_project/features/home/data/product_model.dart';
import 'package:smart_cart_payment_project/features/home/manager/cubits/order/order_cubit.dart';
//import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_cart_payment_project/features/payment_feature/core/utils/styles.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/payment_info_item.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/total_price_widget.dart';

import '../../../../../core/helper/cache_helper.dart';

//import '../../../../home/manager/cubits/order/order_cubit.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });
  //DateTime now = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  // String formattedTime = DateFormat('HH:mm:ss').format(now);

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = OrderCubit.get(context).products;

    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: CacheHelper.getData(key: "isDark")
            ? Theme.of(context).secondaryHeaderColor
            : const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(
              height: 42,
            ),
            PaymentItemInfo(
              title: 'Date',
              value: OrderCubit.get(context).orderModel.date.substring(0, 10),
            ),
            const SizedBox(
              height: 10,
            ),
            PaymentItemInfo(
              title: 'Time',
              value: OrderCubit.get(context).orderModel.date.substring(11, 16),
            ),
            const SizedBox(
              height: 10,
            ),
            PaymentItemInfo(
              title: 'To',
              value: Constants.userName,
            ),
            const Divider(
              height: 60,
              thickness: 2,
            ),
            const SizedBox(
              height: 3,
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 5),
                      child: Row(children: [
                        Text(
                            products[index]
                                .productName
                                .characters
                                .take(16)
                                .toString(),
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800,
                            )),
                        const Spacer(
                          flex: 3,
                        ),
                        Text("${products[index].userQuantity.toString()} pcs",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).hintColor,
                            )),
                        const Spacer(
                          flex: 1,
                        ),
                        Text("${products[index].price.toString()} EGP",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).hintColor,
                            )),
                      ]),
                    );
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            TotalPrice(
              title: 'Total',
              value: "\$${Constants.totalPrice}",
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 50,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.50, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () => OrderCubit.get(context).saveOrder(context),
                      child: Text(
                        'SAVE',
                        textAlign: TextAlign.center,
                        style: Styles.style24
                            .copyWith(color: Constants.primaryColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
