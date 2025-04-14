import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/global/size_box.dart';
import '../../../../utils/style/app_style.dart';
import '../../../../utils/theme/app_colors/basic_color.dart';
import '../../../widgets/custom_widgets/custom_container_widget.dart';
import '../../../widgets/custom_widgets/custom_icon_widget.dart';

class OrderDetailsWidget extends StatelessWidget {

  OrderDetailsWidget({super.key});

  List<dynamic> productList = [
    {
      "id": "1",
      "product_name": "Apple",
      "price": "120000",
      "image_url": "assets/client_slider/0.jpg",
      "attribute_list": [
        {
          "title": "Size",
          "value": "6 Inches"
        },
        // {
        //   "title": "Color",
        //   "value": "White"
        // },
        {
          "title": "Qty",
          "value": "1"
        },
      ],
    },
    {
      "id": "2",
      "product_name": "Urban Blend Long Sleeve Shirt",
      //"product_name": "Urban Blend Long",
      "price": "1200",
      "image_url": "assets/client_slider/1.jpg",
      "attribute_list": [
        {
          "title": "Size",
          "value": "L"
        },
        {
          "title": "Color",
          "value": "Black"
        },
        {
          "title": "Qty",
          "value": "2"
        },
      ],
    },
    {
      "id": "3",
      "product_name": "Monitor",
      "price": "180",
      "image_url": "assets/client_slider/2.jpg",
      "attribute_list": [
        {
          "title": "Size",
          "value": "22 Inches"
        },
        {
          "title": "Color",
          "value": "White"
        },
        {
          "title": "Brand",
          "value": "Dell"
        },
        {
          "title": "Qty",
          "value": "1"
        },
      ],
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            szH15(),
            customContent(topTitleIcon: Icons.location_on_outlined, topTitleIconSize: 22, topTitle: "Delivery Address", titleIcon: Icons.location_pin, titleIconSize: 25, title: "Home(Morshed)", subTitle: "Motijheel, Dhaka"),
            szH15(),
            buildProductContent(),
            szH15(),
            customContent(topTitleIcon: Icons.delivery_dining_outlined, topTitleIconSize: 22, topTitle: "Delivery", titleIcon: Icons.delivery_dining, titleIconSize: 25, title: "Pathao", subTitle: "Esitmal arival 23 - 24 Dec, 2024"),
            szH15(),
            customContent(topTitleIcon: Icons.payment, topTitleIconSize: 22, topTitle: "Payment Methods", titleIcon: Icons.payment, titleIconSize: 23, title: "Mastercard", subTitle: "-----4568"),
            szH15(),
          ],
        ),
      ),
    );
  }

  customContent({IconData topTitleIcon = Icons.add, double topTitleIconSize = 25, String topTitle = "", IconData titleIcon = Icons.add, double titleIconSize = 25, String title = "", String subTitle = ""}){
    return CustomContainerWidget(
      isAllBoarderRadius: true,
      boarderRadius: 10,
      backGroundColor: whiteOnly,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                CustomIconWidget(child: topTitleIcon, size: topTitleIconSize, color: appSecondaryColor.withOpacity(0.7)),
                szW15(),
                Text(topTitle, style: myTxt14(fontWeight: FontWeight.w600, color: labelColorLarge),),
              ],
            ),
            szH6(),
            Divider(thickness: 0.5,),
            szH6(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainerWidget(
                  height: 40,
                  width: 40,
                  backGroundColor: appPrimaryColor,
                  shape: BoxShape.circle,
                  child: CustomIconWidget(child: topTitleIcon, size: titleIconSize, color: whiteOnly,),
                ),
                szW15(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,  maxLines: 1,  style: myTxtCustom(fontSize: 12,  color: blackOnly, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                      szH4(),
                      Text(subTitle, maxLines: 3, style: myTxtCustom(fontSize: 11, color: labelColorMoreMedium, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //product content
buildProductContent(){
    return  CustomContainerWidget(
      isAllBoarderRadius: true,
      boarderRadius: 10,
      backGroundColor: whiteOnly,
      child: Padding(
        padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
        child: Column(
          children: [
            Row(
              children: [
                CustomIconWidget(child: Icons.shop_outlined, size: 23, color: appSecondaryColor.withOpacity(0.7)),
                szW15(),
                Text("Your Order(3)", style: myTxt14(fontWeight: FontWeight.w600, color: labelColorLarge),),
              ],
            ),
            szH6(),
            Divider(thickness: 0.5,),
            szH8(),
            ...productList.map<Widget>((e){
              return  Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: IntrinsicHeight(  // Ensures both sub-content and main content have the same height
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,  // Makes all children take full available height
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Sub-content (Image)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: SizedBox(
                          width: 105,  // Fixed width
                          child: CachedNetworkImage(
                            fit: BoxFit.contain,
                            imageUrl: e["image_url"],
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Image.asset(e["image_url"], fit: BoxFit.fill,),
                            errorWidget: (context, url, error) =>
                                Image.asset(e["image_url"], fit: BoxFit.fill,),
                          ),
                        ),
                      ),

                      // Main content
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Text(
                                  e["product_name"],
                                  maxLines: 2,
                                  style: myTxtCustom(fontSize: 12, color: blackOnly, fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: e["attribute_list"].map<Widget>((attr) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 6),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${attr["title"]}: ",
                                          maxLines: 1,
                                          style: myTxtCustom(fontSize: 12, color: blackOnly, fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          attr["value"],
                                          maxLines: 1,
                                          style: myTxtCustom(fontSize: 12, color: blackOnly, fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                              Text(
                                e["price"],
                                maxLines: 1,
                                style: myTxtCustom(fontSize: 12, color: appPrimaryColor, fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );

            }).toList(),
          ]

        ),
      ),
    );
}
}
