import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/all_colors_export.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home_screen/widgets/custom_triangle_clipp.dart';

class CustomCardWidget extends StatefulWidget {
  CustomCardWidget({super.key, this.imageUrl, this.height, this.productName,
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
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  bool isShopping = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: CustomContainerWidget(
        isAllBoarderRadius: true,
       // isBoxShadow: true,
        boarderRadius: 10,
        //backGroundColor: containerColor,
        backGroundColor: whiteOnly,
        child: Stack(
          children: [
            /// Product
            Positioned(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 80,
                            maxHeight: 200,
                            minWidth: 100,
                            maxWidth: 200,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('${widget.productName}', maxLines: 2, style: myTxtCustom(fontSize: 14, color: blackOnly, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis,),
                        szH4(),
                        Row(
                          children: [
                            Text('\$${widget.discountPrice}', style: myTxtCustom(fontSize: 14, color: appRedColor.withOpacity(0.7), fontWeight: FontWeight.w700)),
                            szW10(),
                            Text('\$${widget.productPrice}', style: myTxtCustom(fontSize: 10, color: labelColorMedium, fontWeight: FontWeight.w500, decoration: TextDecoration.lineThrough, decorationColor: blackOnly),),
                          ],
                        ),
                        szH4(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: appDarkOrangeColor, size: 15,),
                            Text(' ${widget.rating}', style: myTxtCustom(fontSize: 11, color: labelColorMedium, fontWeight: FontWeight.w500,),),
                          ],
                        ),
                        if(getStockAsDouble() != 0)szH4(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if(getStockAsDouble()  != 0)Text('Stock In', style: myTxt12(fontSize: 12, color: labelColorMedium, fontWeight: FontWeight.w400),),
                            // if(getStockAsDouble()  != 0)LinearPercentIndicator(
                            //   width: 80.0,
                            //   animation: true,
                            //   lineHeight: 12.0,
                            //   animationDuration: 1500,
                            //   percent: getStockAsDouble() > 100 ? 1 : getStockAsDouble()/100,
                            //   center: Text("${widget.stock}", style: myTxt10(fontSize: 10, color: whiteOnly, fontWeight: FontWeight.w400),),
                            //   progressColor: /*getStockAsDouble() >= 50 ? appGreenColor : */appSecondaryColorFourth,
                            //   barRadius: Radius.circular(10.r),
                            //   backgroundColor: labelColorExtraSmall,
                            // ),
                            //if(getStockAsDouble()  == 0)Text('Stock Out', style: myTxtCustom(fontSize: 15, color: appRedColor, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //
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

            /// Favorite
            if(getStockAsDouble()  != 0)Positioned(
              top: 8,
              right: 5,
              child: InkWell(
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
                  ),
                ),
              ),
            ),

            if(getStockAsDouble()  == 0)Positioned(
              top: 8,
              right: 5,
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
              bottom: 5,
              right: 5,
              child: CustomContainerWidget(
                height: 30,
                width: 100,
                isBoxShadow: true,
                offsetDx: 0,
                offsetDy: 4,
                shadowColorOpacity: 0.15,
                shadColor: blackOnly,
                blurRadius: 3,
                boarderRadius: 10,
                isAllBoarderRadius: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        topLeftBorderRadius: 10,
                        bottomLeftBorderRadius: 10,
                       // backGroundColor: appPrimaryColor,
                        backGroundColor: appSecondaryColor,
                        child: Icon(Icons.remove, color: whiteOnly, size: 14,),
                      ),
                    ),
                    Text('1', style: myTxtCustom(
                      fontSize: 12, color: appPrimaryColor, fontWeight: FontWeight.w700,
                    )),
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
                        bottomRightBorderRadius: 10,
                        //backGroundColor: appPrimaryColor,
                        backGroundColor: appSecondaryColor,
                        child: Icon(Icons.add, color: whiteOnly, size: 14,),
                      ),
                    ),
                  ],
                ),
              ),
            ) ,

            /// Shopping Cart
            if(isShopping == false &&   getStockAsDouble() != 0)
            Positioned(
              bottom: 5,
              right: 5,
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