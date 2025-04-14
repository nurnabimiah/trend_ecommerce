import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/theme/app_colors/all_colors_export.dart';
import 'package:ecommerce_app/view/features/category_screen/category_controller.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/extensions/screen_padding.dart';
import '../../../../utils/global/size_box.dart';
import '../../../../utils/style/app_style.dart';
import '../../category_screen/category_screen.dart';

class CategoryHomeScreenWidget extends StatelessWidget {
   dynamic items;
   dynamic onTap;

   CategoryHomeScreenWidget({
    this.items,
    this.onTap,
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();
    return CustomContainerWidget(
      //height: 1,
     // backGroundColor: Colors.red,
      backGroundColor: appBackGroundColor,
      child: Column(
        children: [
          Padding(
            padding: screenPadding(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category", style: myTxt15(fontWeight: FontWeight.w600),),
                InkWell(
                  onTap: (){
                    controller.categoryId = "1";
                    controller.subCategoryList = controller.items[0]["sub_category"];
                    controller.update();
                    Get.toNamed(CategoryScreen.routeName);
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
            maxHeight: 125.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                szW12(),
                ...items.map((e){
                  int index = items.indexOf(e);
                  return  InkWell(
                    onTap: (){
                      controller.categoryId = (index + 1).toString();
                      controller.subCategoryList = controller.items[index]["sub_category"];
                      controller.update();
                      Get.toNamed(CategoryScreen.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: e["image"],
                                progressIndicatorBuilder: (context, url, downloadProgress) => Image.asset(e["image"], fit: BoxFit.fill,),
                                errorWidget: (context, url, error) => Image.asset("${e["image"]}", fit: BoxFit.fill,),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                            child: Center(child: Text("Fashion", maxLines: 1, overflow: TextOverflow.ellipsis,)),
                          ),
                        ],
                      ),
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
