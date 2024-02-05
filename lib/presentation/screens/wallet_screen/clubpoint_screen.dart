import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:more_2_drive/presentation/screens/wallet_screen/widgets/dark_blue_container.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/order_shimmer.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ClubPointScreen extends StatefulWidget {
  const ClubPointScreen({super.key});

  @override
  State<ClubPointScreen> createState() => _ClubPointScreenState();
}

class _ClubPointScreenState extends State<ClubPointScreen> {
  int page = 1;

  bool isLoading = true;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    //  OrdersCubit.get(context).getOrders(page ,'' , '');
    super.initState();
    fetchData();
  }

  fetchData() async {
    try {
      // await OrdersCubit.get(context).getOrders(page ,  selectedPaymentStatus ?? '', selectedDeliveryStatus ?? '');
      await WalletCubit.get(context).getClubpoints(page);
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
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        final WalletCubit walletCubit = WalletCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.scaffoldGround,
          appBar:
          AppBar(
            title: Text(
              AppStrings.earnedPoints,
              style: AppTextStyle.cairoSemiBold16white,
            ),
            backgroundColor: AppColors.deepDarkBlue,

          ),
          body: Column(
            children: [
              DarkBlueContainer(),
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
                      walletCubit.getClubpoints(++page);

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
                              itemCount: walletCubit.clubpoints.length,
                              itemBuilder: (context, index) {

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 2,
                                    surfaceTintColor: Colors.blueAccent,
                                    color: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              walletCubit
                                                      .clubpoints[index].points
                                                      .toString() ??
                                                  "",
                                              style:
                                                  AppTextStyle.cairoBoldred17,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize:
                                                      const Size(90, 36),
                                                  backgroundColor:
                                                      AppColors.red3,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                ),
                                                onPressed: () {
                                                  walletCubit
                                                      .addClubpointsToWallet(
                                                          walletCubit
                                                                  .clubpoints[
                                                                      index]
                                                                  .id ??
                                                              0);
                                                },
                                                child: Text(
                                                  AppStrings.collectPoints,
                                                  style: AppTextStyle
                                                      .cairoSemiBold16white,
                                                ),
                                                //onPressed: isLoading ? null : function ,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          walletCubit.clubpoints[index]
                                                  .orderCode ??
                                              "",
                                          style:
                                              AppTextStyle.cairoSemiBold17Black,
                                        ),
                                        Flexible(
                                          child: Image.asset(
                                            Assets.imagesProduct,
                                            height: 130.h,
                                            width: 90.w,
                                            // color: AppColors.Scaffoldfground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
              ),
            ],
          ),
        );
      },
    );
  }
}
