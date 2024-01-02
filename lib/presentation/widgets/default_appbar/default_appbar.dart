
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isSearch;
  final Widget? child;

  final TextEditingController? searchController;
  final onChanged;

  const DefaultAppBar(
      {super.key,
      this.title = '',
      this.isSearch = false,
      this.searchController,
      this.onChanged, this.child});

  @override
  Widget build(BuildContext context) {
    return AppBar(
automaticallyImplyLeading: isSearch?false:true,
      toolbarHeight: isSearch?100.h:60.h,
      backgroundColor: isSearch?AppColors.white:Colors.transparent,
      centerTitle: false,
      title: isSearch
          ? Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.greyTransparent,
                    ),
                      child: TextFormField(
                        onChanged: onChanged,
                        style: AppTextStyle.cairoSemiBold17Black,
                        cursorColor: AppColors.grey4,
                        decoration: InputDecoration(
                          hintText: AppStrings.search,
                          hintStyle: AppTextStyle.cairoThin13Grey,
                          border: InputBorder.none,
                          suffixIcon: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Icon(Icons.search, color: AppColors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              child??SizedBox(),
            ],
          )
          : Text(
              title,
              softWrap: false,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.cairoBold16Blue,
            ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, isSearch?100.h:60.h);
}
// Row(
// children: [
// Text(
// AppStrings.search,
// style: AppTextStyle.cairoMedium14Black,
// ),
// const Spacer(),
// const Icon(Icons.search),
// ],
// ),
