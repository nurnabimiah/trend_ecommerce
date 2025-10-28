
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/images/app_images.dart';
import 'package:ecommerce_app/view/features/menu_screen/widget/profile_info_container_widget.dart';
import 'package:ecommerce_app/view/features/menu_screen/widget/profile_info_title_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_app_bar_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(appBarTitle: 'Account', isLeading: false,),


      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 14.0.w,right: 14.w,top: 10.h),
          child: Column(
            children: [

              //>>>>>>>>>>>>>>>>>>>>>>>>>>>>for profile >>>>>>>>>>>>>>>>>>>>>>>
              ProfileInfoContainerWidget(
                profileName: 'Andrew Ainsley',
                profileEmail: 'andrews@gmail.com',
                profilePhone: '01752929714',
                profileImage: AppImages.profileAvatar,
              ),
              szH10(),
        
              CustomContainerWidget(
                isAllBoarderRadius: true,
                child: Padding(
                  padding:EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 18.h),
                  child: Column(
                    children: [
                      /// Manage Address
                      ProfileInForTitleWidget(
                        title: 'Manage Address',
                        iconImage: AppImages.addressIcon,
                        onTap: () {  },
                      ),
                      szH18(),
        
                      /// Manage Payment
                      ProfileInForTitleWidget(
                        title: 'Manage Payment',
                        iconImage: AppImages.paymentCardIcon,
                        onTap: () {  },),
        
                      /// Account and Security
                      szH18(),
                      ProfileInForTitleWidget(
                        title: 'Account & Security',
                        iconImage: AppImages.accountSecurityIcon,
                        onTap: () {  },),
                    ],
        
                  ),
                ),
              ),
              szH10(),
        
              /// notification,refund policy,data analytics,share,help& support
              CustomContainerWidget(
                isAllBoarderRadius: true,
                child: Padding(
                  padding:EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 18.h),
                  child: Column(
                    children: [
                      ProfileInForTitleWidget(
                        title: 'Notification',
                        iconImage: AppImages.notificationIcon,
                        onTap: () {  },
                      ),
        
        
                      szH20(),
                      ProfileInForTitleWidget(
                        title: 'Refund Policy',
                        iconImage: AppImages.dataAnalyticsIcon,
                        onTap: () {  },
                      ),
        
                      szH20(),
                      ProfileInForTitleWidget(
                        title: 'Data & Analytics',
                        iconImage: AppImages.dataAnalyticsIcon,
                        onTap: () {  }
                        ),
                      szH20(),
        
                      ProfileInForTitleWidget(
                        title: 'Share',
                        iconImage: AppImages.share,
                        onTap: () {  },
                       ),
        
                      szH20(),
                      ProfileInForTitleWidget(
                        title: 'Help & Support',
                        iconImage: AppImages.helpAndSecurityIcon,
                        onTap: () {  },
                      ),
        
                    ],
        
                  ),
                ),
              ),
              szH10(),
        
              /// Log out and Delete account
              CustomContainerWidget(
                isAllBoarderRadius: true,
                child: Padding(
                  padding:EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 18.h),
                  child: Column(
                    children: [
                      /// logout
                      ProfileInForTitleWidget(
                        title: 'Logout',
                        iconImage: AppImages.logout,
                        onTap: () {  },
                      ),
                      szH20(),
        
                      /// delete account
                      ProfileInForTitleWidget(
                        title: 'Delete Account',
                        iconImage: AppImages.deleteAccount,
                        onTap: () {  },
                      ),
        
                    ],
        
                  ),
                ),
              ),
        
        
        
        
            ],
          ),
        ),
      ),

    );
  }
}







