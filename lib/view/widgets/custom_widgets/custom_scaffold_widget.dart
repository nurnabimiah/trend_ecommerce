import 'package:ecommerce_app/utils/theme/app_colors/all_colors_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/style/app_style.dart';

class CustomScaffoldWidget extends StatelessWidget {
  final Widget? body;
  final bool isAppBar;
  final Widget? drawer;
  final bool isAppBarWithPreferredSize;
  final bool isAppBarWithTabBar;

  final dynamic appBarBottomWidget;
  final List<Widget> appBarActionList;
  final dynamic appBarTitle;
  final dynamic leading;
  final Color? scaffoldBackGroundColor;
  final Color? appBarBackGroundColor;
  final Color iconColor;
  final Widget? bottomNavigationBar;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final double bottomHeight;
  final double appBarRadius;

  const CustomScaffoldWidget({
    this.body,
    this.isAppBar = false,
    this.drawer,
    this.appBarTitle,
    this.isAppBarWithPreferredSize = false,
    this.isAppBarWithTabBar = false,
    this.appBarBottomWidget,
    this.appBarActionList = const[],
    this.scaffoldBackGroundColor = appBackGroundColor,
    this.appBarBackGroundColor = appPrimaryColor,
    this.iconColor = whiteOnly,
    this.bottomNavigationBar,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.bottomHeight = 80,
    this.appBarRadius = 0,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackGroundColor,
      extendBody: true,
      drawer: drawer,
      appBar: !isAppBar ?
      null :
      AppBar(
        elevation: 0,
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: appBarBackGroundColor,
        iconTheme: IconThemeData(color: iconColor),
        actions: appBarActionList,
        centerTitle: centerTitle,
        leading: leading,
        title: appBarTitle is String ? Text(appBarTitle, style: myTxt16(color: Colors.white),) : appBarTitle,
        shape: !isAppBarWithPreferredSize
            ? null
            :  RoundedRectangleBorder(

          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(appBarRadius),

          ),
        ),
        bottom: isAppBarWithTabBar ? appBarBottomWidget : isAppBarWithPreferredSize
            ?
        PreferredSize(
          preferredSize: Size.fromHeight(bottomHeight.h),
          child: appBarBottomWidget!,
        ) : null,
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
