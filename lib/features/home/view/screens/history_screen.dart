import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:Auto_Shop/core/utils/constants.dart';
import 'package:Auto_Shop/features/home/manager/cubits/get_orders/get_orders_cubit.dart';

import '../../../../core/helper/cache_helper.dart';
import '../../../../generated/l10n.dart';
import '../widgets/order_history_card.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).orders_history_text,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "RobotoSlab"),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<GetOrdersCubit, GetOrdersState>(
        builder: (context, state) {
          if (state is GetOrdersLoading ||
              state is GetOrdersInitial ||
              state is GetOrderDetailsLoading) {
            return Center(
              child: LoadingAnimationWidget.beat(
                color: Theme.of(context).primaryColor,
                size: 200,
              ),
            );
          } else if (state is GetOrdersSuccess) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.userOrders.length,
                      itemBuilder: (context, index) {
                        return OrderHistoryCard(
                          order: state.userOrders[index],
                          productsData: state.userOrders[index].productsId,
                        );
                      }),
                )
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    CacheHelper.getData(key: "isDark")
                        ? Constants.noProductsDark
                        : Constants.noProducts,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    S.of(context).orders_history_title,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "RobotoSlab",
                    ),
                  ),
                  SizedBox(
                    height: 120.h,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
