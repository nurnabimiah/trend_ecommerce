

import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/basic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutContainerWidget extends StatelessWidget {
  final VoidCallback ? onTap;
  const CheckoutContainerWidget({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: whiteOnly,
        border: Border(top: BorderSide(color: appPrimaryColor, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Total Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total", style: myTxt14()),
              Text("\$500", style: myTxt16()),
            ],
          ),


          /// Checkout Button
          ElevatedButton(
            onPressed:onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: appPrimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            ),
            child: Text('Checkout', style: myTxt14(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}