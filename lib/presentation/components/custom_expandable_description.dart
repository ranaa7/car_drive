import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class ExpandableWidget extends StatelessWidget {
  final String description;

  const ExpandableWidget({
    super.key,
    required this.description,
  });

  @override
  ExpandableNotifier build(BuildContext context) {
    return ExpandableNotifier(
        child: ScrollOnExpand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expandable(
            collapsed: SizedBox(
              height: 50.h,
              width: 320.w,
              child: Html(data: description, shrinkWrap: true, style: {
                // tables will have the below background color
                "p": Style.fromTextStyle(AppTextStyle.cairoBold11White),
                "b": Style.fromTextStyle(AppTextStyle.cairoBold11White),
                // some other granular customizations are also possible
                "tr": Style.fromTextStyle(AppTextStyle.cairoBold11White),
                "th": Style.fromTextStyle(AppTextStyle.cairoBold11White),
                "td": Style.fromTextStyle(AppTextStyle.cairoBold11White),
                // text that renders h1 elements will be red
                "h1": Style.fromTextStyle(AppTextStyle.cairoBold11White),
                "div": Style.fromTextStyle(AppTextStyle.cairoBold11White),
              }),
            ),
            expanded: SizedBox(
              width: 320.w,
              child: Html(data: description, shrinkWrap: true, style: {
                // tables will have the below background color
                "p": Style.fromTextStyle(AppTextStyle.cairoBold11White),
                "b": Style.fromTextStyle(AppTextStyle.cairoBold11White),
                // some other granular customizations are also possible
                "tr": Style.fromTextStyle(AppTextStyle.cairoBold11White),
                "th": Style.fromTextStyle(AppTextStyle.cairoBold11White),
                "td": Style.fromTextStyle(AppTextStyle.cairoBold11White),
                // text that renders h1 elements will be red
                "h1": Style.fromTextStyle(AppTextStyle.cairoBold11White),
              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Builder(
                builder: (context) {
                  var controller = ExpandableController.of(context);
                  return TextButton(
                    child: Text(
                      !controller!.expanded ? AppStrings.showMore : AppStrings.showLess,
                      style: AppTextStyle.cairoBold15White,
                    ),
                    onPressed: () {
                      controller.toggle();
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
