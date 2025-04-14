import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//size box height
szH2()=>SizedBox(height: 2.h);
szH4()=>SizedBox(height: 4.h);
szH5()=>SizedBox(height: 5.h);
szH6()=>SizedBox(height: 6.h);
szH7()=>SizedBox(height: 7.h);
szH8()=>SizedBox(height: 8.h);
szH9()=>SizedBox(height: 9.h);
szH10()=>SizedBox(height: 10.h);
szH12()=>SizedBox(height: 12.h);
szH15()=>SizedBox(height: 15.h);
szH14()=>SizedBox(height: 14.h);
szH18()=>SizedBox(height: 18.h);
szH20()=>SizedBox(height: 20.h);
szH22()=>SizedBox(height: 22.h);
szH25()=>SizedBox(height: 25.h);
szH28()=>SizedBox(height: 28.h);
szH30()=>SizedBox(height: 30.h);
szH32()=>SizedBox(height: 32.h);
szH35()=>SizedBox(height: 35.h);
szH40()=>SizedBox(height: 40.h);
szH45()=>SizedBox(height: 45.h);
szH48()=>SizedBox(height: 48.h);
szH50()=>SizedBox(height: 50.h);
szH60()=>SizedBox(height: 60.h);

//size box width
szW2()=>SizedBox(width: 2.h);
szW4()=>SizedBox(width: 4.h);
szW5()=>SizedBox(width: 5.h);
szW8()=>SizedBox(width: 8.h);
szW6()=>SizedBox(width: 6.h);
szW7()=>SizedBox(width: 7.h);
szW10()=>SizedBox(width: 10.h);
szW12()=>SizedBox(width: 12.h);
szW15()=>SizedBox(width: 15.h);
szW18()=>SizedBox(height: 18.h);
szW20()=>SizedBox(width: 20.h);
szW22()=>SizedBox(width: 22.h);
szW25()=>SizedBox(width: 25.h);
szW28()=>SizedBox(width: 28.h);
szW30()=>SizedBox(width: 30.h);
szW32()=>SizedBox(width: 32.h);
szW35()=>SizedBox(width: 35.h);
szW40()=>SizedBox(width: 40.h);
szW45()=>SizedBox(width: 45.h);
szW48()=>SizedBox(width: 48.h);
szW50()=>SizedBox(width: 50.h);
szW60()=>SizedBox(width: 60.h);

Widget szBx({double? height, double? width}) {
  return SizedBox(
    height: height?.h,
    width: width?.h,
  );
}