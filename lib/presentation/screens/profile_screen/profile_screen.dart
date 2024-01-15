import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';

import 'package:more_2_drive/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:more_2_drive/presentation/screens/login/view_models/login_cubit.dart';
import 'package:more_2_drive/presentation/screens/order_screen/views/widgets/order_container.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/update_profile/update_profile_cubit.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/view_models/counter/counter_cubit.dart';

import 'package:more_2_drive/presentation/screens/profile_screen/wigets/profile_screen_body.dart';
import 'package:more_2_drive/presentation/widgets/button_component/delete_button.dart';

import '../order_screen/views/widgets/empty_order_list.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {

    CounterCubit.get(context).getProfileCount();
    OrdersCubit.get(context).getOrders(1 , '' , '');
    UpdateProfileCubit.get(context).getUserDataByToken();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final int selectedValue =
    // context.supportedLocales.map<String>((e) => e.languageCode).toList().indexOf(context.languageCode);
    return  Scaffold(
      backgroundColor: AppColors.scaffoldGround,
      body:
      ListView(
        padding: EdgeInsets.only(top: 0.h,bottom: 70.h),
        children: [
      const ProfileScreenBody(),
        BlocBuilder<OrdersCubit, OrdersState>(
                buildWhen: (_, current) =>
                current is Ordersloadingstate||
                    current is Ordersfailurestate ||
                    current is Orderssuccessstate,
                builder: (context, state) {
                  if (state is Ordersfailurestate) {
                    return Center(
                      child: Text(state.errMessage),
                    );
                  } else if (state is Orderssuccessstate) {
                    return state.ordermodel.isEmpty
                        ? const EmptyOrdersView()
                        : SizedBox(
                        height: 170.h,
                        child: OrderItem(ordermodel: state.ordermodel, index: 1));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
          SizedBox(height: 30.h,),

          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return DeleteButton(
                onPressed: () async {
                  await LoginCubit.get(context).userDeleteAcc();
                },
              );
            },
          ),
          SizedBox(height: 40.h,)

        ],
      ),

    );
  }
}
