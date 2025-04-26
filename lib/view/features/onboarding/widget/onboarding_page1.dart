
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/images/app_images.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/all_colors_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height ,
        color: appBackGroundColor,
        child: Stack(
          children: [


            Positioned(
                left: 0,
                right: 0,
                top: -10.h,
                child: SvgPicture.asset(AppImages.onboardBg1,width: 375.w,)
            ),


            // app small logo
            Positioned(
                left: 12.w,
                top: 80.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.appSmallLogo,),
                    szH10(),
                    Text('Tredify Online Shop',style: myTxt16(color:whiteOnly ),),
                    szH8(),

                    // Divider
                    SizedBox(
                        width: 160.w,
                        child: Divider(color: whiteOnly,height: 0.1.h,)),
                    szH15(),
                    Text("Professional App for your \n eCommerce business",style: myTxt14(color:whiteOnly ),),


                  ],
                )
            ),

            Positioned(
                left: 0,
                right: 0,
                top: 290.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(AppImages.onboardBg1Purchases,height: 300.h,),
                      szH28(),
                      Text('Purchase Online !!',style: myTxt18(color:blackOnly,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                      szH25(),
                      Text("No crowds, no stress— Just great deals with one\n press!",style: myTxt14(color:blackOnly ),),


                    ],
                  ),
                )
            ),






          ],
        ),

      ),

    );
  }
}
