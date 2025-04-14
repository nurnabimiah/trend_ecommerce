
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/basic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInForTitleWidget extends StatelessWidget {
  final String iconImage;
  final String title;
  final VoidCallback ? onTap;
  final Color? imageColor;
  final IconData? icon;

  const ProfileInForTitleWidget({
    required this.title,
    required this.iconImage,
    required this.onTap,
    this.imageColor,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(iconImage,height: 22.h,width: 22.w,color: imageColor,),
          szW10(),
          Text(title,style: myTxt16(fontWeight: FontWeight.w500),),
          Spacer(),
          Icon(icon ?? Icons.arrow_forward_ios,color: blackOnly,size: 16.sp,)
        ],
      ),
    );
  }
}