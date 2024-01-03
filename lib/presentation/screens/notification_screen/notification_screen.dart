import 'package:flutter/material.dart';



import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';



class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(
          title: AppStrings.notification,
        ),
        body: Container()


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
