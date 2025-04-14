import 'package:ecommerce_app/utils/extensions/screen_padding.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/all_colors_export.dart';
import 'package:ecommerce_app/view/features/my_order_screens/order_controller.dart';
import 'package:ecommerce_app/view/features/my_order_screens/widgets/order_details_widget.dart';
import 'package:ecommerce_app/view/features/my_order_screens/widgets/vertical_stepper_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/global/order_details_class.dart';
import '../../widgets/custom_widgets/custom_scaffold_widget.dart';
import '../../widgets/custom_widgets/custom_single_radio_button_widget.dart';
import '../../widgets/custom_widgets/horizontal_dotted_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const String routeName = '/OrderDetailsScreen';
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  List<dynamic> dataList = [
    {
      "title": "Order has been Taken",
      "time": "9:40 AM",
      "date": "21 December, 24",
      "address": "Dhaka Motijheel",
      "description": "Lorem Ipsum is simply dummy text of  the 1500s,",
      "is_completed": true,
    },
    {
      "title": "Order has been Picked up",
      "time": "9:40 AM",
      "date": "21 December, 24",
      "address": "Dhaka Motijheel",
      "description": "Lorem Ipsum is simply dummy text of the printing",
      "is_completed": true,
    },
    {
      "title": "Order has been On Transit",
      "time": "9:40 AM",
      "date": "21 December, 24",
      "address": "Dhaka Motijheel",
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
      "is_completed": true,
    },
    {
      "title": "Order has been On Transit",
      "time": "9:40 AM",
      "date": "21 December, 24",
      "address": "Dhaka Motijheel",
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been",
      "is_completed": false,
    },
    {
      "title": "Order has been Delivered",
      "time": "9:40 AM",
      "date": "21 December, 24",
      "address": "Dhaka Motijheel",
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
      "is_completed": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) {
        return CustomScaffoldWidget(
          scaffoldBackGroundColor: appBackGroundColor,
          isAppBar: true,
          appBarTitle: "Order Details",
          body: Padding(
            padding: screenPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                szH12(),
                Row(
                  children: [
                    Expanded(
                      child: CustomSingleRadioButtonWidget(
                        selectedString: controller.orderTrackViewButton,
                        buttonLabel: OrderDetailsClass.orderDetailsName,
                        onPressed: (value){
                          controller.orderTrackViewButton = value;
                          controller.update();
                        },
                      ),
                    ),
                    szW15(),
                    Expanded(
                      child: CustomSingleRadioButtonWidget(
                        selectedString: controller.orderTrackViewButton,
                        buttonLabel: OrderDetailsClass.trackOrderName,
                        onPressed: (value){
                          controller.orderTrackViewButton = value;
                          controller.update();
                        },
                      ),
                    ),
                  ],
                ),
                if(controller.orderTrackViewButton == OrderDetailsClass.orderDetailsName)OrderDetailsWidget(),
                if(controller.orderTrackViewButton == OrderDetailsClass.trackOrderName)trackOrderContent(),
              ],
            ),
          ),
        );
      }
    );
  }

  trackOrderContent(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          szH15(),
          // CustomContainerWidget(
          //   child: Row(
          //     //  mainAxisAlignment: MainAxisAlignment.center,
          //     // crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //      Stack(
          //        children: [
          //          Column(
          //            children: [
          //              Icon(Icons.add),
          //              Container(
          //                height: 10,
          //                width: 10,
          //                decoration: BoxDecoration(
          //                  color: Colors.green,
          //                  shape: BoxShape.circle,
          //                ),
          //              ),
          //              Text("Picked up"),
          //            ],
          //          ),
          //          Positioned(top: 25, left: 40, child: Container( height: 5, color: Colors.red,)),
          //          Column(
          //            children: [
          //              Icon(Icons.add),
          //              Container(
          //                height: 10,
          //                width: 10,
          //                decoration: BoxDecoration(
          //                  color: Colors.green,
          //                  shape: BoxShape.circle,
          //                ),
          //              ),
          //              Text("Picked up"),
          //            ],
          //          ),
          //        ],
          //      ),
          //
          //       // Stack(
          //       //   children: [
          //       //     Column(
          //       //       children: [
          //       //         Icon(Icons.add),
          //       //         Container(
          //       //           height: 10,
          //       //           width: 10,
          //       //           decoration: BoxDecoration(
          //       //             color: Colors.green,
          //       //             shape: BoxShape.circle,
          //       //           ),
          //       //         ),
          //       //         Text("Picked up"),
          //       //       ],
          //       //     ),
          //       //    // Expanded(child: Positioned(top: 0, left: 0, child: HorizontalDottedWidget())),
          //       //     Expanded(child: Positioned(top: 25, left: 40, child: Container( height: 5, color: Colors.red,))),
          //       //
          //       //   ],
          //       // ),
          //
          //
          //
          //
          //
          //       // Container(
          //       //   height: 10,
          //       //   width: 10,
          //       //   decoration: BoxDecoration(
          //       //     color: Colors.green,
          //       //     shape: BoxShape.circle,
          //       //   ),
          //       // ),
          //       // szW5(),
          //       // Expanded(child: HorizontalDottedWidget()),
          //       // //szW5(),
          //       // Container(
          //       //   height: 10,
          //       //   width: 10,
          //       //   decoration: BoxDecoration(
          //       //     color: Colors.green,
          //       //     shape: BoxShape.circle,
          //       //   ),
          //       // ),
          //       // szW5(),
          //       // Expanded(child: HorizontalDottedWidget()),
          //       // //szW5(),
          //       // Container(
          //       //   height: 10,
          //       //   width: 10,
          //       //   decoration: BoxDecoration(
          //       //     color: Colors.green,
          //       //     shape: BoxShape.circle,
          //       //   ),
          //       // ),
          //     ],
          //   ),
          // ),
          // szH20(),
          CustomContainerWidget(
            backGroundColor: whiteOnly,
            isAllBoarderRadius: true,
            boarderRadius: 10,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Delivery Status", style: myTxt14(fontWeight: FontWeight.w600),),
                  Divider(),
                  szH5(),
                  VerticalStepperWidget(
                    dataList: dataList,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
