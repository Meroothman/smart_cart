import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_cart_payment_project/features/home/data/order_model.dart';

import '../../../../core/utils/constants.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    super.key,
    required this.productsData,
    required this.order,
  });

  final List productsData;
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 15.h, bottom: 5.h, right: 10.w),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order ID : ${order.orderId}",
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Order Date : ${order.date.characters.take(10).toString()}",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Constants.secondaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productsData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(children: [
                      Text("${productsData[index]['name'].substring(0, 22)}..",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          )),
                      const Spacer(
                        flex: 3,
                      ),
                      Text("${productsData[index]['quantity'] ?? ""} pcs",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Constants.secondaryColor,
                          )),
                      const Spacer(
                        flex: 1,
                      ),
                      Text("${productsData[index]['price'] ?? ""} EGP",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Constants.secondaryColor,
                          )),
                    ]),
                  );
                }),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Total :",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Constants.primaryColor),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "${order.totalPrice ?? ""} EGP",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Constants.secondaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ));
  }
}