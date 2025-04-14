
import 'package:flutter/services.dart';

// class AppExit {
//   /// For Exit App
//   static onExitApp(BuildContext context) {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           scrollable: true,
//           title: Text("Exit App", style: myStyleNunito(fontSize: 18, color: AppColorResources.appPrimaryColor, fontWeight: FontWeight.w500)),
//           content: Text("Do you want to Exit?", style: myStyleNunito(fontSize: 15.sp, color: AppColorResources.secondaryTextColor, fontWeight: FontWeight.w400,)),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child:  Text('No', style: myStyleNunito(fontSize: 13.sp, color: AppColorResources.appBlackColor, fontWeight: FontWeight.w600),)
//             ),
//             TextButton(
//               onPressed: () {
//                 SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//               },
//               child: Text('Yes', style: myStyleNunito(fontSize: 13.sp, color: AppColorResources.appRedColor, fontWeight: FontWeight.w600),)
//             ),
//           ],
//         );
//       },
//     );
//   }
//
// }