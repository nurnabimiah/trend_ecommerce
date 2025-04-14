
import 'dart:developer';

import 'package:ecommerce_app/app_routes.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/images/app_images.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/basic_color.dart';
import 'package:ecommerce_app/view/features/address/screen/address_setup_screen.dart';
import 'package:ecommerce_app/view/features/checkout/screen/widget/checkout_order_widget.dart';
import 'package:ecommerce_app/view/features/menu_screen/widget/profile_info_title_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_app_bar_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckOutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  CheckOutScreen({super.key});

  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        appBarTitle: 'Checkout',
        isLeading: true,
      ),
      body: Column(
        children: [
          /// Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Delivery Address
                    CustomContainerWidget(
                      height: 60.h,
                      boarderRadius: 8,
                      padding: 8,
                      child: ProfileInForTitleWidget(
                        title: 'Delivery Address',
                        iconImage: AppImages.addressIcon,
                        imageColor: appPrimaryColor,
                        onTap: () {
                           log('Clicked the button');
                          Get.toNamed(DeliveryAddressSetupScreen.routeName);
                        },
                      ),
                    ),
                    szH12(),

                    /// Your Order
                    CustomContainerWidget(
                      boarderRadius: 8,
                      padding: 8,
                      child: Column(
                        children: [
                          ProfileInForTitleWidget(
                            title: 'Your Order (3)',
                            iconImage: AppImages.addressIcon,
                            imageColor: appPrimaryColor,
                            onTap: () {},
                          ),
                          Divider(),
                          Column(
                            children: List.generate(
                              1,
                                  (index) => Column(
                                children: [
                                  CheckoutOrderWidget(
                                    imageUrl: "assets/client_slider/1.jpg",
                                    productName: "Product Name",
                                    productPrice: 100,
                                  ),
                                  if (index != 0) Divider(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    szH12(),

                    /// Payment Method
                    CustomContainerWidget(
                      height: 60.h,
                      boarderRadius: 8,
                      padding: 8,
                      child: ProfileInForTitleWidget(
                        title: 'Payment',
                        iconImage: AppImages.addressIcon,
                        imageColor: appPrimaryColor,
                        onTap: () {},
                      ),
                    ),
                    szH12(),

                    /// Promos & Vouchers
                    CustomContainerWidget(
                      height: 60.h,
                      boarderRadius: 8,
                      padding: 8,
                      child: ProfileInForTitleWidget(
                        title: 'Promos and Vouchers',
                        iconImage: AppImages.addressIcon,
                        imageColor: appPrimaryColor,
                        onTap: () {},
                      ),
                    ),
                    szH12(),

                    /// Review Summary
                    CustomContainerWidget(
                      boarderRadius: 8,
                      padding: 8,
                      child: Column(
                        children: [
                          ProfileInForTitleWidget(
                            title: 'Review Summary',
                            iconImage: AppImages.addressIcon,
                            imageColor: appPrimaryColor,
                            onTap: () {},
                          ),
                          szH8(),
                          Divider(),
                          szH12(),

                          /// Subtotal
                          summaryRow('Sub total', '\$ 10.20'),
                          szH8(),

                          /// VAT
                          summaryRow('0% VAT', '\$ 0.00'),
                          szH8(),

                          /// Delivery Cost
                          summaryRow('Delivery Cost', '\$ 0.50'),
                          szH8(),

                          /// Discount
                          summaryRow('Discount', '-\$70.0'),
                          szH8(),

                          Divider(color: black500, thickness: 0.3),
                          szH8(),

                          /// Total Payment
                          summaryRow('Total Payment', '\$70.0', isBold: true),
                          szH14()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: ElevatedButton(
          onPressed: () {
            // Perform Checkout Action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: appPrimaryColor,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Proceed to Checkout',
            style: myTxt16(fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }

  /// Helper method for summary rows
  Widget summaryRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: myTxt16(
            fontSize: 14.sp,
            color: blackOnly,
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: myTxt16(
            fontSize: 14.sp,
            color: blackOnly,
            fontWeight: isBold ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}



