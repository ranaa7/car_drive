import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';

class SelectInput extends FormField<String> {
  final String? currentValue;
  final String? label;
  final String? hint;
  final String? validatorText;
  final void Function(String? value)? onChanged;
  final List<String> items;
  final Widget? icon;
  final bool secondDesign;

  SelectInput({
    super.key,
    this.secondDesign = false,
    this.currentValue,
    this.label,
    this.hint,
    this.validatorText,
    FormFieldValidator<String>? validator,
    this.onChanged,
    required this.items,
    this.icon,
  }) : super(
    validator: validator ??
            (value) {
          if ((currentValue ?? '').isEmpty) {
            return validatorText ?? 'This Field is required!';
          }
          return null;
        },
    onSaved: onChanged,
    initialValue: currentValue,
    builder: (FormFieldState<String> state) {
      Color color =
      currentValue == null ? Colors.black26 : Colors.black87;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) Text( label, style: AppTextStyle.cairoSemiBold15Grey,),
           SizedBox(height: 8.h),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return items.map<PopupMenuItem<String>>((String value) {
                return PopupMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 200.w,
                    child: Text( value, style: AppTextStyle.cairoSemiBold15Grey,)
                  ),
                );
              }).toList();
            },
            onSelected: (String? value) {
              state.didChange(value);
              onChanged!(value);
            },
            child: Container(
              height: 46.h,
              padding:  EdgeInsets.symmetric(horizontal: 16.h),
              decoration: BoxDecoration(
                border: secondDesign
                    ? Border(
                    bottom: BorderSide(
                        color: state.hasError
                            ? const Color(0xFFFF0000)
                            : Colors.black.withOpacity(0.1)))
                    : Border.all(
                    color: state.hasError
                        ? const Color(0xFFFF0000)
                        : Colors.black.withOpacity(0.1)),
                borderRadius:secondDesign?null: BorderRadius.circular(6),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  icon ?? const SizedBox(),
                  icon != null ?  SizedBox(width: 8.w) : const SizedBox(),
                  Expanded(
                    child: Text(
                       currentValue ?? hint ?? label ?? '',
                      maxLines: 1,
                    ),
                  ),
                  secondDesign?const SizedBox():    Icon(Icons.arrow_drop_down, color: color),
                ],
              ),
            ),
          ),
          (state.hasError && state.errorText != null)
              ? Padding(
            padding:
             EdgeInsets.symmetric(vertical: 6.w, horizontal: 12.h),
            child: Text(
               state.errorText ?? '',
            ),
          )
              : const SizedBox.shrink(),
           SizedBox(height: 8.h),
        ],
      );
    },
  );
}
