import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/presentation/screens/order_details/view/order_details_cubit.dart';
import 'package:more_2_drive/presentation/screens/order_details/view_models/order_details_screen.dart';
import 'package:more_2_drive/presentation/screens/order_screen/data/models/order_model.dart';

import '../../../../../config/style/text_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../utils/strings/routes_names.dart';

class OrderItem extends StatelessWidget {

  const OrderItem ({super.key , required this.ordermodel , required this.index});
  final List<PurchaseHistoryModel> ordermodel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: index,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
            OrderDetailsCubit.get(context).getOrdersDetails(ordermodel[index].id );
            Navigator.pushNamed(context , RouteName.orderDetailsScreen);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDetailsScreen(id: ordermodel[index].id)));
            },
            child: Card(
             elevation: 2,
              surfaceTintColor: Colors.transparent,

              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset(
                    Assets.imagesProduct,
                    height: 130.h,
                   // color: AppColors.Scaffoldfground,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          ordermodel[index].code?? "",
                          style: AppTextStyle.cairoBold17DarkRed
                      ),
                      Row(
                        children: [
                          Text(
                              ordermodel[index].date?? "",
                              style: AppTextStyle.cairoSemiBold17Black
                          ),

                         Padding(
                           padding: const EdgeInsets.only(left: 60),
                           child: Text(
                               ordermodel[index].grandTotal?? "",
                               style: AppTextStyle.cairoBold17DarkRed
                           ),
                         ),
                        ],
                      ),
                      Row(children: [
                        Text(
                            "Payment Status-",
                            style: AppTextStyle.cairoSemiBold17Black
                        ),
                        Text(
                          ordermodel[index].paymentStatus?? "",
                          style:  ordermodel[index].paymentStatus == "unpaid"
                              ? AppTextStyle.cairoSemiBold17DarkRed
                              : AppTextStyle.cairoSemiBold17green,                                        ),
                      ],),

                      Row(children: [
                        Text(
                            "Delivery Status-",
                            style: AppTextStyle.cairoSemiBold17Black
                        ),
                        Text(
                          ordermodel[index].deliveryStatus ?? "",
                          style:
                          AppTextStyle.cairoSemiBold17Black
                          ,                                        ),
                      ],),




                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
