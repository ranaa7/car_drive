import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';

class CarDropList<T> extends StatelessWidget {
  final List<T> items;
  final Future<List<T>> Function(String)? asyncItems;
  final String? emptyText;
  final String hintText;
  final String Function(T)? itemsAsString;
  final bool Function(T, T)? compareFn;
  final bool Function(T, String)? filterFn;
  final void Function(T?)? onChange;
  final Widget Function(BuildContext, T, bool)? itemBuilder;

  const CarDropList(
      {super.key,
        required this.items,
        this.asyncItems,
        this.itemsAsString,
        this.compareFn,
        this.filterFn,
        this.onChange,
        this.itemBuilder,
        this.emptyText,
        required this.hintText});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      items: items,
      asyncItems: asyncItems,
      itemAsString: itemsAsString,
      compareFn: compareFn,
      filterFn: filterFn,
      popupProps: PopupProps.menu(
        showSelectedItems: true,
        emptyBuilder: (context, searchEntry) => Center(
            child: Text(emptyText ?? '', style: AppTextStyle.cairoBold17Red)),
        showSearchBox: true,
        errorBuilder: (context, error, item) => SizedBox(
          height: 200.h,
          child: Center(
            child:
            Text(emptyText ?? '', style: AppTextStyle.cairoBold17Red),
          ),
        ),
        containerBuilder: (context, widget) => SizedBox(
          height: 200.h,
          child: widget,
        ),
        searchFieldProps: TextFieldProps(
          padding: const EdgeInsets.all(8),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey4)),
            constraints: BoxConstraints.tightFor(height: 36.h),
          ),
          style: AppTextStyle.cairoMedium14Black,
          textAlign: TextAlign.center,
        ),
        itemBuilder: itemBuilder,
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: AppTextStyle.cairoMedium14Black,
        textAlign: context.isRTL?TextAlign.start:TextAlign.end,
        dropdownSearchDecoration: InputDecoration(

            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 0.w,color: AppColors.grey3),
                borderRadius: BorderRadius.circular(10.r)

            ),
            disabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10.r)

            ),
            errorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10.r)

            ),
            focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10.r)

            ),
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10.r)

            ),
            contentPadding:
            EdgeInsets.only(top: 10.h, right: 20.w, bottom: 10.h, left: 10.w),
            hintTextDirection: context.isRTL?TextDirection.ltr:TextDirection.rtl,
            hintText: hintText),
      ),
      dropdownButtonProps: const DropdownButtonProps(isVisible: true),

      onChanged: onChange,
    );
  }
}
