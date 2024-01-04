
import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/widgets/setting_widgets/sized_box_radio.dart';

class SettingRadioButton extends StatelessWidget {
  final int value;
  final int? selectedValue;
  final String text;
  final void Function(int?)? onChanged;
  const SettingRadioButton(
      {super.key,
      required this.value,
      required this.text,
       this.selectedValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBoxRadio(
      value: value,
      groupValue: (selectedValue??0),
      onChanged: onChanged??(v){},
      child: Text(
        text,
        style: value == (selectedValue??0)
            ? AppTextStyle.cairoBold13White
            : AppTextStyle.cairoBold11black,
      ),
    );
  }
}
