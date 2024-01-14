import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {


  int page =1;
  bool isLoading = true;



  @override
  void initState() {
    //  OrdersCubit.get(context).getOrders(page ,'' , '');
    super.initState();
    fetchData();
  }

  fetchData() async {
    try {
      // await OrdersCubit.get(context).getOrders(page ,  selectedPaymentStatus ?? '', selectedDeliveryStatus ?? '');
      await WalletCubit.get(context).getWalletHistory(page);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // Handle error if needed
      print('Error fetching orders: $e');
    }
  }

  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(

      builder: (context, state) {
      //  WalletCubit.get(context)
        final WalletCubit walletCubit = WalletCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: Text(AppStrings.myWallet, style: AppTextStyle.cairoSemiBold16DarkBlue, ),backgroundColor:AppColors.scaffoldGround ,),

          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h,),
                  Container(
                      width: 350.w,
                      height: 180.0.h,
                      decoration: BoxDecoration(
                        color: AppColors.darkRed,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.walletBalance,
                            style: AppTextStyle.cairoSemiBold24white,
                          ),
                          Text(
                            WalletCubit.get(context).balance,
                            style: AppTextStyle.cairoSemiBold24white,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text(
                              AppStrings.lastRecharged,
                              style: AppTextStyle.cairoSemiBold16white,
                            ),
                            Text(
                              WalletCubit.get(context).recharged,
                              style: AppTextStyle.cairoSemiBold16white,
                            ),
                          ],)
                        ],)

                  ),
                  SizedBox(height: 16.0.h),
                  CircleAvatar(
                    radius: 70.r,
                    backgroundColor: AppColors.red4, // Change the color as needed
                    child: IconButton(
                      icon: Icon(Icons.add, size: 60, color: AppColors.darkRed ,),
                      onPressed: () {
                        // Add your onPressed functionality here
                        print('Add button pressed!');
                      },
                    ),
                  ),
                  Text(
                    AppStrings.walletCharging,
                    style: AppTextStyle.cairoSemiBold23black,
                  ),

                  SizedBox(height: 20.h),

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
                          walletCubit.getWalletHistory(++page);

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
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(
                          width: 500.w,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: walletCubit.wallethistory.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 2,
                                surfaceTintColor: Colors.transparent,
                                color: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Column(
                                      children: [
                                        Text(
                                          walletCubit.clubpoints[index].points.toString() ?? "",
                                          style: AppTextStyle.cairoBoldred17,
                                        ),

                                        // ElevatedButton(
                                        //   style: ElevatedButton.styleFrom(
                                        //     minimumSize: const Size(150, 36),
                                        //     backgroundColor: AppColors.darkRed,
                                        //     shape: const RoundedRectangleBorder(
                                        //         borderRadius: BorderRadius.all(Radius.circular(10))),
                                        //   ), onPressed: (){
                                        //   walletCubit.addClubpointsToWallet(walletCubit.clubpoints[index].id ?? 0);
                                        // },
                                        //   child: Text(AppStrings.collectPoints , style: AppTextStyle.cairoSemiBold16white ,),
                                        //   //onPressed: isLoading ? null : function ,
                                        // ),
                                      ],
                                    ),




                                    Text(
                                      walletCubit.clubpoints[index].orderCode ??"",
                                      style: AppTextStyle.cairoSemiBold17Black,
                                    ),

                                  ],
                                ),
                              );
                            },
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
