import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:more_2_drive/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:more_2_drive/presentation/screens/order_screen/views/widgets/order_container.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/order_shimmer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../config/style/app_colors.dart';
import '../../../../config/style/text_styles.dart';
import '../../../../utils/strings/app_strings.dart';
import '../../../widgets/default_appbar/default_appbar.dart';

class OrderScreen extends StatefulWidget {
   const OrderScreen({super.key});


  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

   int page =1;
   bool isLoading = true;

  final RefreshController _refreshController = RefreshController();
   String? selectedPaymentStatus;
   List<String> paymentStatusItems = [ 'paid', 'unpaid'];


   String? selectedDeliveryStatus;
   List<String> deliveryStatusItems = [ 'pending', 'picked_up', 'cancelled'];


   @override
   void initState() {
    //  OrdersCubit.get(context).getOrders(page ,'' , '');
     super.initState();
     fetchData();
   }

   fetchData() async {
     try {
       await OrdersCubit.get(context).getOrders(page ,  selectedPaymentStatus ?? '', selectedDeliveryStatus ?? '');
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
    final OrdersCubit ordersCubit=OrdersCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldGround,
      appBar: DefaultAppBar(title: AppStrings.purchaseHistory,),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                PhysicalModel(
                        color: Colors.transparent,
                        elevation: 5, // Adjust the elevation for the shadow
                        borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                        child: Container(
                width: 150.w,
                decoration: BoxDecoration(
                  color: Colors.white, // Set the background color of the dropdown
                  borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'All Payments',
                          style: AppTextStyle.cairoSemiBold17Black
                        ),
                      ),
                      items: paymentStatusItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                              style: AppTextStyle.cairoSemiBold17Black                 ),
                        );
                      }).toList(),
                      value: selectedPaymentStatus,
                      onChanged: (String? value) {
                        setState(() {
                          selectedPaymentStatus = value;
                          fetchData(); // Call the API when payment status changes
                        });
                      },

                    ),
                  ),
                ),),
                const Spacer(),
                PhysicalModel(
                  color: Colors.transparent,
                  elevation: 5, // Adjust the elevation for the shadow
                  borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                  child: Container(
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: Colors.white, // Set the background color of the dropdown
                      borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                              'All Deliveries',
                              style: AppTextStyle.cairoSemiBold17Black
                          ),
                        ),
                        items: deliveryStatusItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                                item,
                                style: AppTextStyle.cairoSemiBold17Black                 ),
                          );
                        }).toList(),
                        value: selectedDeliveryStatus,
                        onChanged: (String? value) {
                          setState(() {
                           selectedDeliveryStatus = value;
                            fetchData(); // Call the API when payment status changes
                          });
                        },

                      ),
                    ),
                  ),),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: SmartRefresher(
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
                      ordersCubit.getOrders(++page ,'','');
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
                    ? Padding(
                      padding:  EdgeInsets.only(bottom: 550.h),
                      child: const Center(child: OrderShimmer()),
                    )
                    : OrderItem(ordermodel: OrdersCubit.get(context).myOrderList, index: OrdersCubit.get(context).myOrderList.length)
              ),
          ),
        ],
      ),
    );
  },
);
  }
}
