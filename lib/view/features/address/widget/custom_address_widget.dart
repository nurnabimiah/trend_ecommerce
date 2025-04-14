


import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/basic_color.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddressWidget extends StatelessWidget {
  const CustomAddressWidget({
    super.key,required this.titleForAddress,required this.personName,
    required this.personMobile,
    required this.address,
    required this.index,
    this.isMainAddress = false,
    this.isSelected = false,
    required this.onTap,

  });

  final int index;
  final String titleForAddress;
  final String personName;
  final String personMobile;
  final String address;
  final bool? isMainAddress;
  final bool isSelected;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainerWidget(
        height: 180.h,
        boarderRadius: 8.r,
        boarderColor: isSelected == true ?appPrimaryColor : Colors.grey,
        isAllBoarder: true,
        isAllBoarderRadius: true,
        boarderWidth: 1.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Home, main address, share
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(titleForAddress,style:myTxt16(),),
                  szW10(),

                  isMainAddress == true?CustomContainerWidget(
                    height: 32.h,
                    width: 90.w,
                    boarderRadius: 8.r,
                    boarderColor: appPrimaryColor,
                    isAllBoarder: true,
                    isAllBoarderRadius: true,
                    boarderWidth: 1,
                    child: Center(child: Padding(
                      padding:  EdgeInsets.only(left: 6.0.w,right: 6.w),
                      child: Text('Main Address',style: myTxt10(fontSize: 11.sp),),
                    )),

                  ) : SizedBox.shrink(),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.black87,)),


                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(personName,style: myTxt16()),
                  SizedBox(width: 5.w,),
                  Text((personMobile),style: myTxt14()),
                ],
              ),
              szH10(),
              Row(
                children: [
                  Text(address,style:myTxt15(),),
                  szW10(),
                  Icon(Icons.check,color: appPrimaryColor,)
                ],
              ),
              szH10(),

              Row(
                children: [
                  Icon(Icons.location_pin,color: Colors.blueGrey,size: 18.sp,),
                  szW10(),
                  Text("Pinpoint already",style:myTxt15(),),
                ],
              )





            ],
          ),
        ),
      ),
    );
  }
}