

import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/basic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  final String appBarTitle;
  final bool isLeading ;
  const CustomAppBarWidget({super.key,required this.appBarTitle,required this.isLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTitle,style: myTxt16(color: whiteOnly),),
      centerTitle: true,
      backgroundColor:appPrimaryColor  ,
      leading: isLeading ?Padding(
        padding: EdgeInsets.only(left: 10.w, top: 12.h, bottom: 12.h, right: 12.w),
        child: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
              height: 30.h,
              width: 30.w,
              // decoration: BoxDecoration(
              //     color: whiteOnly,
              //     shape: BoxShape.circle,
              //     boxShadow: [
              //       BoxShadow(
              //         offset: Offset(0, 4),
              //         blurRadius: 4,
              //       ),
              //     ]
              // ),
              child: Icon(Icons.arrow_back_ios_outlined, color: Colors.white, size: 16.sp,),
            )),
      ) : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}