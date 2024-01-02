import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/screens/order_details/view_models/widgets/timeline_component.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../cubits/orders_cubit/orders_cubit.dart';
import '../order_screen/views/widgets/empty_order_list.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final CountdownController _controller = CountdownController(autoStart: false);
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List notification = [1];
    return Scaffold(
        appBar: DefaultAppBar(
          title: AppStrings.notification,
        ),
        body: ListView(children: [
          TimelineTile(
            isFirst:false ,
            isLast: false,
            beforeLineStyle: LineStyle(color:   AppColors.grey),
            indicatorStyle: IndicatorStyle(
                width: 40,
                color:  AppColors.grey,
                iconStyle: IconStyle(iconData: Icons.done ,
                    color:  AppColors.grey
                )
            ),
            endChild: Material(
              child: Container(
                padding: EdgeInsets.only(left: 16), // Adjust left padding as needed
                child: Text(
                  "Order placed",
                  style: AppTextStyle.cairoSemiBold15Grey,
                ),
              ),
            ),

          ),
        ],)


        // notification.isEmpty
        //     ? Center(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             CustomImageView(
        //               svgPath: Assets.svgEmptyNotificaion,
        //               fit: BoxFit.contain,
        //               height: 280.h,
        //               width: 260.w,
        //             ),
        //             SizedBox(
        //               height: 30.h,
        //             ),
        //             SizedBox(
        //                 width: 330.w,
        //                 child: Text(
        //                   AppStrings.emptyNotification,
        //                   style: AppTextStyle.cairoMedium20Grey,
        //                   textAlign: TextAlign.center,
        //                 ))
        //           ],
        //         ),
        //       )
        //     : Center(
        //         child: Column(
        //           children: [
        //             ElevatedButton(
        //               child: const Text('Start'),
        //               onPressed: () {
        //                 _controller.start();
        //               },
        //             ),
        //             Countdown(
        //               controller: _controller,
        //               seconds: 60,
        //               build: (context, double time) => Text(
        //                 time.toString(),
        //                 style: const TextStyle(
        //                   fontSize: 100,
        //                 ),
        //               ),
        //               interval: const Duration(seconds: 1),
        //               onFinished: () {
        //                 ScaffoldMessenger.of(context).showSnackBar(
        //                   const SnackBar(
        //                     content: Text('Timer is done!'),
        //                   ),
        //                 );
        //               },
        //             ),
        //           ],
        //         ),
        //       )

    );
  }
}
