import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/order_shimmer.dart';
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
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              AppStrings.walletBalance,
                              style: AppTextStyle.cairoSemiBold24white,
                            ),
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
                  IconButton(onPressed: (){}, icon: Image.asset(Assets.imagesWalletImgg , ) , iconSize: 70,),


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
                            ? const Center(child: OrderShimmer())
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

                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Text(
                                            walletCubit.wallethistory[index].amount ?? "",
                                            style: AppTextStyle.cairoBoldred17,
                                          ),

                                          Text(
                                            walletCubit.wallethistory[index].approvalString??"",
                                            style: AppTextStyle.cairoSemiBold17Black,
                                          ),

                                        ],
                                      ),
                                    ),




                                    Padding(
                                        padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Text(
                                            walletCubit.wallethistory[index].date ??"",
                                            style: AppTextStyle.cairoSemiBold17Black,
                                          ),

                                          Text(
                                            "Payment Method",
                                            style: AppTextStyle.cairoSemiBold17Black,
                                          ),
                                          Text(
                                            walletCubit.wallethistory[index].paymentMethod ??"",
                                            style: AppTextStyle.cairoSemiBold17Black,
                                          ),
                                        ],
                                      ),
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
