import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineComponent extends StatelessWidget {
  const TimelineComponent({
    Key? key,
    required this.color,
    required this.islast,
    required this.isfirst,
    required this.color2,
    required this.icon,
    required this.text,
    required this.iconcolor,
  }) : super(key: key);

  final bool isfirst;
  final bool islast;
  final Color color;

  final Color iconcolor;
  final Color color2;

  final IconData icon;

  final String text;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isfirst,
      isLast: islast,
      beforeLineStyle: LineStyle(color: color, thickness: 6 , ), // Adjust thickness here if needed
      indicatorStyle: IndicatorStyle(
        width: 30.w,
        color: color,
        iconStyle: IconStyle(
          iconData: Icons.done,
          color: color,
        ),
      ),
      endChild: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: AppTextStyle.cairoSemiBold15Grey),
                // Use SizedBox to increase space between text and divider
                SizedBox(height: 37.h), // Adjust height here
                // Add a divider
                Container(
                  height: 1,
                  color: Colors.grey,
                  width: double.infinity,
                ),
              ],
            ),
          ),
          // Add an icon on the right
          CircleAvatar(
            radius: 20,
            backgroundColor: iconcolor ,
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
      // Adjust itemExtent to increase vertical spacing between circles
     // itemExtent: 60, // Adjust height here
    );
  }
}
