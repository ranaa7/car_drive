// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:more_2_drive/config/style/text_styles.dart';
// import 'package:more_2_drive/generated/assets.dart';
// import 'package:more_2_drive/presentation/components/custom_image_view.dart';
// import 'package:more_2_drive/presentation/screens/cart_screen/cart_screen.dart';
// import 'package:more_2_drive/presentation/screens/categories_screen/categories_screen.dart';
// import 'package:more_2_drive/presentation/screens/home_screen/home_screen.dart';
// import 'package:more_2_drive/presentation/screens/notification_screen/notification_screen.dart';
// import 'package:more_2_drive/presentation/screens/profile_screen/profile_screen.dart';
//
// import 'package:more_2_drive/utils/strings/app_strings.dart';
// import 'package:more_2_drive/utils/strings/routes_names.dart';
//
// class NavBar extends StatefulWidget {
//   const NavBar({super.key});
//
//   @override
//   State<NavBar> createState() => _NavBarState();
// }
//
// class _NavBarState extends State<NavBar> {
//   var tabIndex = 0;
//
//   void changeTabIndex(int index) {
//     setState(() {
//       tabIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: IndexedStack(index: tabIndex, children: const [
//         HomeScreen(),
//         CategoriesScreen(),
//         CartScreen(),
//         NotificationScreen(),
//         ProfileScreen()
//       ]),
//       bottomNavigationBar: BottomAppBar(
//           height: 80.h,
//           shape: const CircularNotchedRectangle(),
//           notchMargin: 20,
//           child: BottomNavigationBar(
//             backgroundColor: Colors.transparent,
//             selectedLabelStyle: AppTextStyle.cairoThin11Red,
//             unselectedLabelStyle: AppTextStyle.cairoThin11Grey,
//             elevation: 0,
//             type: BottomNavigationBarType.fixed,
//             selectedFontSize: 12.sp,
//             currentIndex: tabIndex,
//             unselectedFontSize: 10.sp,
//             onTap: changeTabIndex,
//             selectedItemColor: Colors.red,
//             items: [
//               itemBar(Assets.svgHome, AppStrings.home),
//               itemBar(Assets.svgCategory, AppStrings.category),
//               const BottomNavigationBarItem(
//                   icon: Icon(
//                     Icons.home,
//                     color: Colors.transparent,
//                   ),
//                   label: ""),
//               itemBar(Assets.svgNotification, AppStrings.notification),
//               itemBar(Assets.svgProfile, AppStrings.profile)
//             ],
//           )),
//       floatingActionButton: SizedBox(
//         height: 70.h,
//         width: 70.w,
//         child: FloatingActionButton(
//           backgroundColor: Colors.red,
//           onPressed: () => Navigator.pushNamed(
//             context,
//             RouteName.cartScreen,
//           ),
//           child: CustomImageView(
//             svgPath: Assets.svgCart,
//             height: 33.h,
//             width: 33.w,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
//
// itemBar(String icon, String label) {
//   return BottomNavigationBarItem(
//       icon: CustomImageView(
//         svgPath: icon,
//         height: 35.h,
//         width: 35.w,
//         fit: BoxFit.contain,
//       ),
//       label: label);
// }
