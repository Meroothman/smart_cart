import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Auto_Shop/core/utils/constants.dart';
import 'package:Auto_Shop/features/home/data/product_model.dart';
import 'package:Auto_Shop/features/home/manager/cubits/order/order_cubit.dart';
//import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Auto_Shop/features/payment_feature/core/utils/styles.dart';
import 'package:Auto_Shop/features/payment_feature/view/widgets/payment_widgets/payment_info_item.dart';
import 'package:Auto_Shop/features/payment_feature/view/widgets/payment_widgets/total_price_widget.dart';

import '../../../../../core/helper/cache_helper.dart';
import '../../../../../generated/l10n.dart';

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
             Text(
              S.of(context).thank_you_text,
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              S.of(context).Your_transaction_was_successful_text,
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(
              height: 42,
            ),
            PaymentItemInfo(
              title: S.of(context).date_text,
              value: OrderCubit.get(context).orderModel.date.substring(0, 10),
            ),
            const SizedBox(
              height: 10,
            ),
            PaymentItemInfo(
              title: S.of(context).time_text,
              value: OrderCubit.get(context).orderModel.date.substring(11, 16),
            ),
            const SizedBox(
              height: 10,
            ),
            PaymentItemInfo(
              title: S.of(context).to_text,
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
                        Text("${products[index].userQuantity.toString()} ${S.of(context).pcs_text}",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).hintColor,
                            )),
                        const Spacer(
                          flex: 1,
                        ),
                        Text("${products[index].price.toString()} ${S.of(context).EGP}",
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
              title: S.of(context).total,
              value: "${Constants.totalPrice}  ${S.of(context).EGP}",
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
                        S.of(context).save_text,
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
