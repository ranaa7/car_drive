import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:more_2_drive/presentation/widgets/buttons/button_1.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Column(
        children: [
          PaymentSummaryItem(
              object: OrderCubit.get(context).cartSummary?.subTotal ?? '',
              text: AppStrings.subtotal),
          PaymentSummaryItem(
              object: OrderCubit.get(context).cartSummary?.tax ?? '',
              text: AppStrings.tax),
          PaymentSummaryItem(
              object: OrderCubit.get(context).cartSummary?.shippingCost ?? '',
              text: AppStrings.shippingCost),
          PaymentSummaryItem(
              object: OrderCubit.get(context).cartSummary?.discount ?? '',
              text: AppStrings.discount),
          const Divider(),
          PaymentSummaryItem(isTotal:true,object: OrderCubit.get(context).cartSummary?.grandTotal??"", text: AppStrings.totalOutput),
          SizedBox(height: 10.h,),
          Button1(height: 50, width: 100, onPressed: ()=>Navigator.pop(context), text: AppStrings.close, color: AppColors.red)
        ],
      ),
    );
  }
}

class PaymentSummaryItem extends StatelessWidget {
  final String object;
  final String text;
  final bool isTotal;

  const PaymentSummaryItem(
      {super.key, required this.object, required this.text, this.isTotal=false});

  @override
  Widget build(BuildContext context) {
    return context.isRTL?Row(
      children: [
        Text(
          object,
          style: isTotal?AppTextStyle.cairoSemiBold15Red:AppTextStyle.cairoSemiBold15Grey,
        ),
        const Spacer(),
        Text(
          text,
          style: AppTextStyle.cairoSemiBold15Grey,
        ),
      ],
    ):Row(
      children: [
        Text(
          text,
          style: AppTextStyle.cairoSemiBold15Grey,
        ),
        const Spacer(),

        Text(
          object,
          style: isTotal?AppTextStyle.cairoSemiBold15Red:AppTextStyle.cairoSemiBold15Grey,
        ),

      ],
    );
  }
}
