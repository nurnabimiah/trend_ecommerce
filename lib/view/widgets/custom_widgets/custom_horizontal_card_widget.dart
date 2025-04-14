import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/all_colors_export.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../features/home_screen/widgets/custom_triangle_clipp.dart';

class CustomHorizontalCardWidget extends StatefulWidget {
  CustomHorizontalCardWidget({super.key, this.imageUrl, this.height, this.productName,
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
  State<CustomHorizontalCardWidget> createState() => _CustomHorizontalCardWidgetState();
}

class _CustomHorizontalCardWidgetState extends State<CustomHorizontalCardWidget> {
  bool isShopping = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: CustomContainerWidget(
        width: 270,
        isAllBoarderRadius: true,
       // isBoxShadow: true,
        boarderRadius: 10,
       // backGroundColor: containerColor,
        backGroundColor: whiteOnly,
        child: Stack(
          children: [
            /// Product
            Positioned(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 150,
                            maxHeight: 150,
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.star, color: appDarkOrangeColor, size: 18,),
                                  Text(' ${widget.rating}', style: myTxtCustom(fontSize: 13, color: labelColorLarge, fontWeight: FontWeight.w600,),),
                                ],
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                                child: CustomContainerWidget(
                                    isAllBoarderRadius: true,
                                    boarderRadius: 4,
                                    // backGroundColor: appSecondaryColorFourth,
                                    backGroundColor: appBackGroundColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(isFavorite == false ? Icons.favorite_outline : Icons.favorite, color: appPrimaryColor, size: 22,),
                                    )
                                ),
                              ),
                            ],
                          ),
                          szH2(),
                          Text('${widget.productName}', maxLines: 3, style: myTxtCustom(fontSize: 13.5, color: blackOnly, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis,),
                          szH4(),
                          Row(
                            children: [
                              Text('\$${widget.discountPrice}', style: myTxtCustom(fontSize: 14, color: appRedColor.withOpacity(0.7), fontWeight: FontWeight.w700)),
                              szW10(),
                              Text('\$${widget.productPrice}', style: myTxtCustom(fontSize: 10, color: labelColorMedium, fontWeight: FontWeight.w500, decoration: TextDecoration.lineThrough, decorationColor: blackOnly),),
                            ],
                          ),
                          if(getStockAsDouble() != 0)szH4(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if(getStockAsDouble()  != 0)Text('Stock In', style: myTxt12(fontSize: 12, color: labelColorMedium, fontWeight: FontWeight.w400),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // /// For Discount Percentage Card
            if(widget.percentage != 0 && getStockAsDouble() != 0) Positioned(
              top: 8,
              left: 0,
              child: InkWell(
                onTap: (){},
                child: FadeIn(
                  delay: Duration(milliseconds: 250),
                  child: ClipPath(
                    clipper: InwardArrowClipper(),
                    child: CustomContainerWidget(
                      height: 20,
                      width: 70,
                      backGroundColor: appSecondaryColor,
                      isOnlyPadding: true,
                      leftPadding: 3,
                      rightPadding: 4,
                      alignment: Alignment.centerLeft,
                      child: Text('${widget.percentage}% OFF', style: myTxt10(fontSize: 11, color: whiteOnly, fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
              ),
            ),

            if(getStockAsDouble()  == 0)Positioned(
              // top: 8,
              // right: 5,
              top: 8,
              left: 0,
              child: CustomContainerWidget(
                isAllBoarderRadius: true,
                boarderRadius: 5,
                padding: 4,
                backGroundColor: yellowFirst,
                child: Text('Stock Out', style: myTxtCustom(fontSize: 12, color: appRedColor, fontWeight: FontWeight.w500),),
              ),
            ),
            /// Increment and Decrement
            if(isShopping)
            Positioned(
              bottom: 20,
              left: 82,
              child: CustomContainerWidget(
                height: 100,
                width: 30,
                isBoxShadow: true,
                offsetDx: 0,
                offsetDy: 4,
                shadowColorOpacity: 0.15,
                shadColor: blackOnly,
                blurRadius: 3,
                boarderRadius: 10,
                isAllBoarderRadius: true,
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Increment
                    InkWell(
                      onTap: (){
                        setState(() {
                          isShopping = false;
                        });
                      },
                      child: CustomContainerWidget(
                        height: 30,
                        width: 30,
                        isOnlyBorderRadius: true,
                        topRightBorderRadius: 10,
                        topLeftBorderRadius: 10,
                        //backGroundColor: appPrimaryColor,
                        backGroundColor: appSecondaryColor,
                        child: Icon(Icons.add, color: whiteOnly, size: 14,),
                      ),
                    ),
                    Text('1', style: myTxtCustom(
                      fontSize: 12, color: appPrimaryColor, fontWeight: FontWeight.w800,
                    )),
                    /// Decrement
                    InkWell(
                      onTap: (){
                        setState(() {
                          isShopping = false;
                        });
                      },
                      child: CustomContainerWidget(
                        height: 30,
                        width: 30,
                        isOnlyBorderRadius: true,
                        bottomRightBorderRadius: 10,
                        bottomLeftBorderRadius: 10,
                        // backGroundColor: appPrimaryColor,
                        backGroundColor: appSecondaryColor,
                        child: Icon(Icons.remove, color: whiteOnly, size: 14,),
                      ),
                    ),
                  ],
                ),
              ),
            ) ,

            /// Shopping Cart
            if(isShopping == false &&   getStockAsDouble() != 0)
            Positioned(
              bottom: 20,
              left: 82,
              child: InkWell(
                onTap: (){
                  setState(() {
                    isShopping = true;
                  });
                },
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appPrimaryColor,
                    //color: appSecondaryColor,
                  ),
                  child: Icon(Icons.shopping_cart_outlined, color: whiteOnly, size: 14,),
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