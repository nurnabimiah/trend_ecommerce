import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/utils/theme/app_colors/basic_color.dart';
import 'package:ecommerce_app/view/features/address/controller/pick_address_controller.dart';
import 'package:ecommerce_app/view/features/address/widget/custom_address_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class DeliveryAddressSetupScreen extends StatefulWidget {
  static const String routeName = '/deliveryAddressSetup';
  const DeliveryAddressSetupScreen({super.key});

  @override
  State<DeliveryAddressSetupScreen> createState() => _DeliveryAddressSetupScreenState();
}

class _DeliveryAddressSetupScreenState extends State<DeliveryAddressSetupScreen> {

  final PickAddressController controller = Get.put(PickAddressController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        appBarTitle: 'Choose Delivery Address',
        isLeading: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            /// For main Address
            Obx(() => CustomAddressWidget(
              index: 0,
              titleForAddress: 'Home',
              personName: 'Nayon Ahmed',
              personMobile: '++01752929714',
              address: '175 New York City, USA',
              isMainAddress: true,
              isSelected: controller.selectedIndex.value == 0,
              onTap: () => controller.selectedAddress(0),
            )),
            szH10(),
            

            /// Apartment
            Obx(() => CustomAddressWidget(
              index: 1,
              titleForAddress: 'Apartment',
              personName: 'Nayon Ahmed',
              personMobile: '++01752929714',
              address: '175 New York City, USA',
              isSelected: controller.selectedIndex.value == 1,
              onTap: () => controller.selectedAddress(1),
            )),
            szH10(),


            /// Moms House
            Obx(() => CustomAddressWidget(
              index: 2,
              titleForAddress: 'Moms House',
              personName: 'Nayon Ahmed',
              personMobile: '++01752929714',
              address: '175 New York City, USA',
              isSelected: controller.selectedIndex.value == 2,
              onTap: () => controller.selectedAddress(2),
            )),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Perform Checkout Action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: appPrimaryColor,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Ok',
                  style: myTxt16(fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
            szH10(),


          ],
        ),
      ),
    );
  }
}



