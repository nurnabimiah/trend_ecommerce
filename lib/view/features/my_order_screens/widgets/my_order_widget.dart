
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/all_colors_export.dart';
import 'package:ecommerce_app/view/features/my_order_screens/order_details_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_icon_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_widgets/custom_popup_menu_button.dart';


class MyOrderWidget extends StatefulWidget {
  MyOrderWidget({super.key, this.imageUrl, this.height, this.productName,
    this.discountPrice, this.productPrice, this.stock, this.rating, this.percentage, this.width, this.productId, this.onTap});
  dynamic productId;
  dynamic imageUrl;
  dynamic height;
  dynamic width;
  dynamic productName;
  dynamic productPrice;
  dynamic discountPrice;
  dynamic rating;
  dynamic stock;
  dynamic percentage;
  dynamic onTap;

  @override
  State<MyOrderWidget> createState() => _MyOrderWidgetState();
}

class _MyOrderWidgetState extends State<MyOrderWidget> {
  bool isShopping = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: CustomContainerWidget(
        height: 220,
        isAllBoarderRadius: true,
        // isBoxShadow: true,
        boarderRadius: 10,
        // backGroundColor: containerColor,
        backGroundColor: whiteOnly,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomIconWidget(child: Icons.calendar_month, size: 22,),
                      szW15(),
                      Text("Today, January 30, 2025", style: myTxt14(),),
                    ],
                  ),
                  CustomPopupMenuButton(
                    menuItems: [
                        PopupMenuItemData(
                          value: "Cancel",
                          label: "Cancel",
                          icon: Icons.remove_circle_outline_outlined,
                          onTap: () {
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
            szH8(),
            Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 140,
                            maxHeight: 140,
                            minWidth: 105,
                            maxWidth: 105,
                          ),
                          child: CachedNetworkImage(
                            fit: BoxFit.contain,
                            imageUrl: widget.imageUrl,
                            progressIndicatorBuilder: (context, url, downloadProgress) => Image.asset(widget.imageUrl, fit: BoxFit.fill,),
                            errorWidget: (context, url, error) => Image.asset("${widget.imageUrl}", fit: BoxFit.fill,),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${widget.productName}',  maxLines: 1,  style: myTxtCustom(fontSize: 14,  color: blackOnly, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                                szH2(),
                                Text('+2 other products', maxLines: 1, style: myTxtCustom(fontSize: 12, color: blackOnly, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                            szH8(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total Shopping', maxLines: 1, style: myTxtCustom(fontSize: 12, color: blackOnly, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,),
                                szH2(),
                                Text('Tk ${widget.productPrice}', maxLines: 1, style: myTxtCustom(fontSize: 14, color: appPrimaryColor, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                              ],
                            ),

                         //   ElevatedButton(onPressed: (){}, child: Text("data")),
                            szH8(),
                            CustomTextButton(
                              textColor: appPrimaryColor,
                              backgroundColor: whiteOnly,
                              boarderColor: appPrimaryColor,
                              boarderWidth: 0.6,
                              borderRadius: 10,
                              onPressed: (){
                                Get.toNamed(OrderDetailsScreen.routeName);
                              },
                              textWidget: "Track Order",
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getStockAsDouble(){
    return double.parse(widget.stock.toString());
  }
}