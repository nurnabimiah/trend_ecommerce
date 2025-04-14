
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/basic_color.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CheckoutOrderWidget extends StatelessWidget {

  final String imageUrl ;
  final String productName;
  final dynamic productPrice;

  const CheckoutOrderWidget({
    super.key,required this.imageUrl,
    required this.productName,
    required this.productPrice
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget(
      isAllBoarderRadius: true,
      boarderRadius: 10,
      backGroundColor: whiteOnly,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
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
                        fit: BoxFit.cover,
                        imageUrl:imageUrl,
                        progressIndicatorBuilder: (context, url, downloadProgress) => Image.asset(imageUrl, fit: BoxFit.fill,),
                        errorWidget: (context, url, error) => Image.asset(imageUrl, fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w,top: 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(productName,  maxLines: 1,  style: myTxtCustom(fontSize: 16.sp,  color: blackOnly, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                        szH8(),
                        Text('Size : L', maxLines: 1, style: myTxtCustom(fontSize: 12.sp, color: blackOnly, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,),
                        szH8(),

                        Text('Color: Black', maxLines: 1, style: myTxtCustom(fontSize: 12, color: blackOnly, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,),
                        szH8(),
                        Text('Qty: 1', maxLines: 1, style: myTxtCustom(fontSize: 12, color: blackOnly, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,),
                        szH8(),
                        Text('Tk ${productPrice}', maxLines: 1, style: myTxtCustom(fontSize: 14, color: appPrimaryColor, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
