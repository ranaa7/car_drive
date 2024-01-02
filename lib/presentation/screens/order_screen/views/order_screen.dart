import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:more_2_drive/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:more_2_drive/presentation/screens/order_screen/views/widgets/order_container.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../config/style/app_colors.dart';
import '../../../../config/style/text_styles.dart';
import '../../../../utils/strings/app_strings.dart';
import '../../../widgets/default_appbar/default_appbar.dart';
import '../../../widgets/shimmer/categories_shimmer.dart';

class OrderScreen extends StatefulWidget {
   OrderScreen({super.key});


  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

   int page =1;
   bool isLoading = true;

  final RefreshController _refreshController = RefreshController();
   @override
   void initState() {
      OrdersCubit.get(context).getOrders(page);
     super.initState();
     fetchData();
   }

   fetchData() async {
     try {
       await OrdersCubit.get(context).getOrders(page);
       setState(() {
         isLoading = false;
       });
     } catch (e) {
       // Handle error if needed
       print('Error fetching orders: $e');
     }
   }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
  builder: (context, state) {
    return Scaffold(
      appBar: DefaultAppBar(title: AppStrings.purchasehist,),
      body:  SmartRefresher(
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus? mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SpinKitPouringHourGlassRefined(
                      color: AppColors.black,
                    ),
                    Text(
                      AppStrings.loadMoreProduct,
                      style: AppTextStyle.cairoSemiBold17Black,
                    ),
                  ],
                );
              } else if (mode == LoadStatus.loading) {
                body = Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SpinKitPouringHourGlassRefined(
                      color: AppColors.black,
                    ),
                    Text(
                      AppStrings.loadMoreProduct,
                      style: AppTextStyle.cairoSemiBold17Black,
                    ),
                  ],
                );
              } else if (mode == LoadStatus.failed) {
                body = const Text("Load Failed!Click retry!");
              } else if (mode == LoadStatus.canLoading) {
                body = const Text("release to load more");
              } else {
                body = const Text("No more Data");
              }
              return SizedBox(
                height: 55.0.h,
                child: Center(child: body),
              );
            },
          ),
          enablePullUp: true,
          onLoading: () async {
            await Future.delayed(const Duration(seconds: 1));
                OrdersCubit.get(context).getOrders(++page);
            _refreshController.loadComplete();
          },
          onRefresh: () {
            setState(() {
              isLoading = true;
              Future.delayed(const Duration(seconds: 2)).then((_) {
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              });
              _refreshController.refreshCompleted();
            });
          },
          controller: _refreshController,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : OrderItem(ordermodel: OrdersCubit.get(context).myOrderList, index: OrdersCubit.get(context).myOrderList.length)
        ),
    );
  },
);
  }
}
