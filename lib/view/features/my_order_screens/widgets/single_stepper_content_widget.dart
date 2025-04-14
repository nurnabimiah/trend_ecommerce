import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/all_colors_export.dart';
import 'package:flutter/material.dart';

class SingleStepperContentWidget extends StatelessWidget {
  final dynamic dataItem;
  const SingleStepperContentWidget({
    this.dataItem,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dataItem["title"], style: myTxt13(fontWeight: FontWeight.w600),),
        szH5(),
        Row(
          children: [
            Text(dataItem["date"], style: myTxt12(color: labelColorMedium),),
            szW10(),
            Text(dataItem["time"], style: myTxt12(color: labelColorMoreMedium),),
          ],
        ),
        szH5(),
        Text(dataItem["address"], style: myTxt13(fontWeight: FontWeight.w500, color: labelColorLarge),),
      ],
    );
  }
}
