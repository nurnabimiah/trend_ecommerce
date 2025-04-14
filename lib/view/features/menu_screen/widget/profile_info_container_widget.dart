


import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/images/app_images.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/basic_color.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoContainerWidget extends StatelessWidget {
  final String profileName;
  final String profileEmail;
  final String profilePhone;
  final String profileImage;
  const ProfileInfoContainerWidget({
    super.key,
    required this.profileName,
    required this.profileEmail,
    required this.profilePhone,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget(
      height: 110.h,
      isAllBoarderRadius: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: appPrimaryColor,width: 0.5)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:profileImage,
                    progressIndicatorBuilder: (context, url, downloadProgress) => Image.asset(AppImages.profileAvatar, fit: BoxFit.fill,),
                    errorWidget: (context, url, error) => Image.asset(AppImages.profileAvatar, fit: BoxFit.fill,),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w,),


            Padding(
              padding:  EdgeInsets.only(top: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profileName,style: myTxt16(),),
                  szH6(),
                  Text(profileEmail,style: myTxt14(),),
                  szH6(),
                  Text(profilePhone,style: myTxt14(),),

                ],
              ),
            )





          ],

        ),
      ),

    );
  }
}