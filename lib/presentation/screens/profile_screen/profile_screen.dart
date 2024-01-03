import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:more_2_drive/presentation/screens/login/view_models/login_cubit.dart';
import 'package:more_2_drive/presentation/screens/order_screen/views/widgets/order_container.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/view_models/counter/counter_cubit.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/wigets/column_profile.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/wigets/icon_container.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/wigets/profile_screen_body.dart';
import 'package:more_2_drive/presentation/widgets/button_component/delete_button.dart';
import 'package:more_2_drive/presentation/widgets/setting_widgets/setting_radio_button.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

import '../../../config/style/text_styles.dart';
import '../../../core/network/local/cache_helper.dart';
import '../../../utils/strings/routes_names.dart';
import '../order_screen/views/widgets/empty_order_list.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void initState() {

    CounterCubit.get(context).getProfileCount();
    OrdersCubit.get(context).getOrders(1 , '' , '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int selectedValue =
    context.supportedLocales.map<String>((e) => e.languageCode).toList().indexOf(context.languageCode);
    return  Scaffold(
      backgroundColor: AppColors.Scaffoldfground,
      body:
      ListView(

        children: [
      profileScreenBody(),
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
                        : Container(
                        height: 170.h,
                        child: OrderItem(ordermodel: state.ordermodel, index: 1));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),

          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return DeleteButton(
                onPressed: () async {
                  await LoginCubit.get(context).userDeleteAcc();
                },
              );
            },
          ),
          SizedBox(height: 20.h,)

        ],
      ),

    );
  }
}
