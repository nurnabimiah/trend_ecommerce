
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/view/features/cart/widget/card_product_widget.dart';
import 'package:ecommerce_app/view/features/cart/widget/checkout_container.dart';
import 'package:ecommerce_app/view/features/checkout/screen/check_out_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBarWidget(appBarTitle: 'My Cart', isLeading: false,),

      body: Column(
        children: [
          
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.w,right: 10.w),
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => szH10(),
                  itemCount: 5,
                  padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                  itemBuilder: (BuildContext context,index){
                    return CardProductWidget();
                  },
              ),
            ),
          ),


          /// checkout  Portion
          CheckoutContainerWidget(
            onTap: () {
              Get.toNamed(CheckOutScreen.routeName);
            },
          ),
        ],
      ),


    );
  }
}







