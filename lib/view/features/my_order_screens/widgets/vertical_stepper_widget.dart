import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/theme/app_colors/all_colors_export.dart';
import 'package:ecommerce_app/view/features/my_order_screens/widgets/single_stepper_content_widget.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_widgets/dot_dot_circle_widget.dart';
import '../../../widgets/custom_widgets/vertical_dotted_widget.dart';

class VerticalStepperWidget extends StatelessWidget {
  final List<dynamic> dataList;

  const VerticalStepperWidget({
    required this.dataList,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    int lastIndex = dataList.length-1;
    return Column(
      children: dataList.map<Widget>((e){
        int index = dataList.indexOf(e);
        bool nextOneDone = false;
        int nextIndex = index+1;
        if(nextIndex < dataList.length){
          nextOneDone = dataList[nextIndex]["is_completed"];
        }
        return buildStepperContent(e, index, lastIndex, nextOneDone);
      }).toList(),

      // [
      //   buildStepperContent(),
      //   buildStepperContent(),
      //   buildStepperContent(),
      // ],

    );
  }

  buildStepperContent(dynamic data, int index, int lastIndex, bool nextOneDone) {

    return IntrinsicHeight(
        child: Row(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                index == 0 ? Expanded(child: Container()) : Expanded(
                  child:
                  VerticalDivider(
                    color: data["is_completed"] ? appPrimaryColor: Colors.grey,
                  ),
                ),
                DottedCircleWidget(
                  dotColor: data["is_completed"] ? appPrimaryColor: Colors.grey,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: data["is_completed"] ? appPrimaryColor : Colors.grey,
                      shape: BoxShape.circle
                    ),
                  ),
                ),
                index == lastIndex ? Expanded(child: Container()) : Expanded(
                  child: VerticalDivider(
                    color: !nextOneDone ?  Colors.grey : data["is_completed"] ? appPrimaryColor : Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10, bottom: index == lastIndex ? 0 : 20),
                child: SingleStepperContentWidget(
                  dataItem: data
                ),
              ),
            ),
          ],
        ),
      );
  }
}
