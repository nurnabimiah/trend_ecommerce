
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/images/app_images.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/basic_color.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProductWidget extends StatelessWidget {
  const CardProductWidget({super.key,});

  @override
  Widget build(BuildContext context) {

    return CustomContainerWidget(
      backGroundColor: Colors.white,
       isAllBoarder: true,
      boarderColor: appPrimaryColor,
      boarderWidth: 1,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(AppImages.profileAvatar,fit: BoxFit.cover,)
          ),

          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Samsung Galaxy Z fold 3 5G',style: myTxt14(),),
                    szH10(),
                    Row(
                      children: [
                        Text('Color : ',style: myTxt14(),),
                        Text('Black',style: myTxt14(),),
                      ],
                    ),
                    szH18(),
                    CustomContainerWidget(
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
                              // setState(() {
                              //   isShopping = false;
                              // });
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
                              // setState(() {
                              //   isShopping = false;
                              // });
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
                    )

                  ],
                ),
              )
          ),

          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(right: 8.h,bottom: 8.h,top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.delete,color: Colors.redAccent,size: 18.sp,),
                    szBx(height: 8.h),
                    Text("\$500",style: myTxt14(),),
                    Text("X",style: myTxt14(),),
                    szBx(height: 5.h),
                    Text("1",style: myTxt14(),),
                    szBx(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Total:",style: myTxt16(),),
                        Text("100",style: myTxt16(),),
                      ],
                    ),



                  ],
                ),
              )
          ),

        ],),
    );
  }
}