import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
  });
  final String productName;
  final String productImage;
  final num productPrice;
  final num productQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      padding: EdgeInsets.only(top: 5.h, bottom: 5.h, right: 10.w),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100.w,
            height: 150.h,
            child: Image(
              image: NetworkImage(productImage),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "RobotoSlab",
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Row(children: [
                    Text(
                      "${S.of(context).price_text} $productPrice ${S.of(context).EGP}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: "RobotoSlab",
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                    " ${S.of(context).quantity_text} $productQuantity",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: "RobotoSlab",
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      '${S.of(context).total_text} ${productPrice * productQuantity} ${S.of(context).EGP}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        fontFamily: "ProtestRiot-Regular",
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
