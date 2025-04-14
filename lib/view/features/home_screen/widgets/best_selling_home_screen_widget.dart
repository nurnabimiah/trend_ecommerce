import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/theme/app_colors/all_colors_export.dart';
import 'package:ecommerce_app/view/features/products_landing_screen/products_landing_controller.dart';
import 'package:ecommerce_app/view/features/products_landing_screen/products_landing_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_horizontal_card_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/extensions/screen_padding.dart';
import '../../../../utils/global/size_box.dart';
import '../../../../utils/style/app_style.dart';
import '../../../widgets/custom_widgets/custom_card_widget.dart';

class BestSellingHomeScreenWidget extends StatelessWidget {
  dynamic items;
  dynamic onTap;

  BestSellingHomeScreenWidget({
    this.items,
    this.onTap,
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final productLandingController = Get.find<ProductsLandingController>();
    return CustomContainerWidget(
      //height: 1,
      backGroundColor: appBackGroundColor,
      child: Column(
        children: [
          Padding(
            padding: screenPadding(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Best Selling", style: myTxt15(fontWeight: FontWeight.w600),),
                InkWell(
                  onTap: (){
                    productLandingController.appBarTitle = "Best Sellings";
                    productLandingController.update();
                    Get.toNamed(ProductsLandingScreen.routeName);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon(Icons.arrow_forward, ),
                      CustomIconWidget(
                        child: "assets/png/right-arrow.png",
                        height: 24,
                        color: appSecondaryColor,
                      ),
                      szW10(),
                      Text("View All", style: myTxt13(),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          szH5(),
          LimitedBox(
            maxHeight: 160.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                szW12(),
                ...items.map((e){
                  return  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CustomHorizontalCardWidget(
                      imageUrl: e["image"],
                      productName: e["product_name"],
                      stock: e["stock"],
                      discountPrice: e["discount"],
                      productPrice: e["price"],
                      percentage: e["percentage"],
                      rating: e["rating"],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
