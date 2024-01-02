import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/presentation/screens/order_details/data/models/order_details_model.dart';
import 'package:more_2_drive/presentation/screens/order_details/view/order_details_cubit.dart';
import 'package:more_2_drive/presentation/screens/order_details/view_models/widgets/timeline_component.dart';
import 'package:more_2_drive/presentation/screens/order_item/data/models/order_item_model.dart';
import 'package:more_2_drive/presentation/screens/order_item/view/order_item_cubit.dart';
import 'package:more_2_drive/presentation/screens/order_item/view_models/widgets/payment_row.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../config/style/text_styles.dart';
import '../../../../utils/strings/app_strings.dart';
import '../../../widgets/default_appbar/default_appbar.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key , required this.id});

  final int? id;
  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int _index = 0;

  void initState() {
    OrderItemCubit.get(context).getOrdersItems(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: AppColors.Scaffoldfground,
        appBar: DefaultAppBar(
          title: AppStrings.orderDetails,

        ),
        body: SingleChildScrollView(
          child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
            builder: (context, state) {
              if (state is OrderDetailsSuccess) {
                List<orderDetails> orderdetailsList = state.orderdetails;
                return SingleChildScrollView(
                  child: Column(
                    children: [

                      Row(children: [
                        Expanded(
                          child: Row(
                            children: [

                              Expanded(
                                child: Column(children: [

                                  TimelineComponent(color: orderdetailsList[0].deliveryStatusString == "Order Placed" ? AppColors.green1 : AppColors.grey , islast: false, isfirst: true , color2: orderdetailsList[0].deliveryStatusString == "Order Placed" ? AppColors.white : AppColors.grey, icon: Icons.list_alt_outlined, text: AppStrings.orderplaced, iconcolor: Colors.blue ,),

                                  TimelineComponent(color: orderdetailsList[0].deliveryStatusString == "Confirmed" ? AppColors.green1 : AppColors.grey , islast: false, isfirst: false , color2: orderdetailsList[0].deliveryStatusString == "Confirmed" ? AppColors.white : AppColors.grey, icon: Icons.check, text: AppStrings.confirmed, iconcolor: Colors.green ),
                                  TimelineComponent(color: orderdetailsList[0].deliveryStatusString == "On Delivery" ? AppColors.green1 : AppColors.grey , islast: false, isfirst: false , color2: orderdetailsList[0].deliveryStatusString == "On Delivery" ? AppColors.white : AppColors.grey, icon: Icons.fire_truck, text: AppStrings.onDelivery, iconcolor: Colors.orange ),
                                  TimelineComponent(color: orderdetailsList[0].deliveryStatusString == "Delivered" ? AppColors.green1 : AppColors.grey , islast: true, isfirst: false , color2: orderdetailsList[0].deliveryStatusString == "Delivered" ? AppColors.white : AppColors.grey, icon: FontAwesomeIcons.checkDouble, text: AppStrings.delivered, iconcolor: Colors.purple),
                                ],),
                              ),

                            ],
                          ),
                        )
                      ],),



                       SizedBox(height: 40.h,),
                      Card(
                        elevation: 10,
                        surfaceTintColor: Colors.transparent,
                        color: AppColors.Scaffoldfground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order Code",
                                        style: AppTextStyle.cairoBold15black,
                                      ),
                                      Text(
                                        "Shipping method",
                                        style: AppTextStyle.cairoBold15black,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        orderdetailsList[0].code ?? "",
                                        style: AppTextStyle.cairoBold17DarkRed,
                                      ),
                                      Text(
                                        orderdetailsList[0].shippingType ?? "",
                                        style: AppTextStyle.cairoSemiBold15Grey,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order Date",
                                        style: AppTextStyle.cairoBold15black,
                                      ),
                                      Text(
                                        "Payment Method",
                                        style: AppTextStyle.cairoBold15black,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        orderdetailsList[0].date ?? "",
                                        style: AppTextStyle.cairoSemiBold15Grey,
                                      ),
                                      Text(
                                        orderdetailsList[0].paymentType ?? "",
                                        style: AppTextStyle.cairoSemiBold15Grey,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Payment status",
                                        style: AppTextStyle.cairoBold15black,
                                      ),
                                      Text(
                                        "Delivery status",
                                        style: AppTextStyle.cairoBold15black,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            orderdetailsList[0].paymentStatus ??
                                                "",
                                            style:
                                                AppTextStyle.cairoSemiBold15Grey,
                                          ),
                                          FaIcon(
                                            orderdetailsList[0].paymentStatus ==
                                                    "unpaid"
                                                ? Icons.dangerous
                                                : FontAwesomeIcons.circleCheck,
                                            color: orderdetailsList[0]
                                                        .paymentStatus ==
                                                    "unpaid"
                                                ? AppColors.darkRed
                                                : Colors.green,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        orderdetailsList[0].deliveryStatus ?? "",
                                        style: AppTextStyle.cairoSemiBold15Grey,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Pickup Point",
                                        style: AppTextStyle.cairoBold15black,
                                      ),
                                      Text(
                                        "Total Amount",
                                        style: AppTextStyle.cairoBold15black,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Name: ${orderdetailsList[0].pickupPoint?.name ?? ""} ",
                                        style: AppTextStyle.cairoSemiBold15Grey,
                                      ),
                                      Text(
                                        orderdetailsList[0].grandTotal ?? "",
                                        style: AppTextStyle.cairoBold24DarkRed,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Address:${orderdetailsList[0].pickupPoint?.address ?? ""} ",
                                        style: AppTextStyle.cairoSemiBold15Grey,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Ordered product",
                        style: AppTextStyle.cairoBoldgrey20,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlocBuilder<OrderItemCubit, OrderItemState>(
                        builder: (context, state) {
                          if (state is OrderItemSuccess) {
                            List<OrderDetailsItem> orderdetailsItems = state.orderItems ;
                            return Card(
                              elevation: 20,

                              surfaceTintColor: Colors.transparent,
                              color: AppColors.Scaffoldfground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Expanded(
                                child: Container(
                                  height: 900.h,
                                  child: ListView.separated(
                                    shrinkWrap: true, // Set shrinkWrap to true
                                   // physics: NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.all(8),
                                    itemCount: orderdetailsItems.length,
                                    separatorBuilder: (BuildContext context, int index) {
                                      // Add a Divider between each ordered product
                                      return Divider(
                                        color: Colors.grey,
                                        height: 16,
                                        thickness: 1,
                                      );
                                    },
                                    itemBuilder: (BuildContext context, int index) {
                                      return Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(height: 30.h),
                                                Text(
                                                  orderdetailsItems[index].productName ??"",
                                                  style: AppTextStyle
                                                      .cairoSemiBold15Grey,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${orderdetailsItems[index].quantity} x item",
                                                      style: AppTextStyle
                                                          .cairoBold15black,
                                                    ),
                                                    Text(
                                                      orderdetailsItems[index].price ??"",
                                                      style: AppTextStyle
                                                          .cairoBold17DarkRed,
                                                    ),
                                                  ],
                                                ),


                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          } else if (state is OrderItemLoading) {
                            // Handle loading state if needed
                            return Center(child: CircularProgressIndicator());
                          } else {
                            // Handle other states if needed
                            return Center(child: Text("Unexpected state"));
                          }
                        },
                      ),
                      SizedBox(height: 40.h,),
                      PaymentRowComponent(text1: "Sub Total", text2: orderdetailsList[0].subtotal ?? ""),
                      SizedBox(
                        height: 10.h,
                      ),
                      PaymentRowComponent(text1: "Tax", text2: orderdetailsList[0].tax ?? ""),
                      SizedBox(
                        height: 10.h,
                      ),
                      PaymentRowComponent(text1: "Shipping Cost", text2: orderdetailsList[0].shippingCost ?? ""),
                      SizedBox(
                        height: 10.h,
                      ),
                      PaymentRowComponent(text1: "Discount", text2: orderdetailsList[0].couponDiscount ?? ""),
                      SizedBox(
                        height: 10.h,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 16,
                        thickness: 1,
                      ),
                        PaymentRowComponent(text1: "Grand Total", text2: orderdetailsList[0].grandTotal ?? ""),
                      SizedBox(
                        height: 10.h,
                      ),

                    ],
                  ),
                );
              } else if (state is OrderDetailsLoading) {
                // Handle loading state if needed
                return Center(child: CircularProgressIndicator());
              } else {
                // Handle other states if needed
                return Center(child: Text("Unexpected state"));
              }
            },
          ),
        ));
  }
}
