import 'package:ecommerce_app/utils/extensions/screen_padding.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/view/features/my_order_screens/order_controller.dart';
import 'package:ecommerce_app/view/features/my_order_screens/widgets/my_order_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_icon_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/global/centralize_button_class.dart';
import '../../../utils/global/my_order_status_class.dart';
import '../../../utils/theme/app_colors/basic_color.dart';
import '../../widgets/custom_widgets/custom_scaffold_widget.dart';
import '../../widgets/custom_widgets/custom_search_widget.dart';


class MyOrderScreen extends StatefulWidget {
  static const String routeName = '/MyOrderScreen';
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  final controller = Get.find<OrderController>();
  bool _isLoading = false;

  List<String> subCatergoryButtonList = ["Active", "Pending", "Completed", "Cancelled",];

  @override
  void initState() {
    // TODO: implement initState
    CentralizeButtonClass().initializeButtonKeys(subCatergoryButtonList);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) {
        return CustomScaffoldWidget(
          isAppBar: true,
          isAppBarWithPreferredSize: true,
          bottomHeight: 50,
          automaticallyImplyLeading: false,
          appBarTitle: controller.isSearch ? CustomSearchWidget(
            onSearch: (value){
              controller.fetchingOrderData(value);
            },
          ) : "My Orders",
          appBarActionList: [
            if(!controller.isSearch)InkWell(
              onTap: (){
                controller.isSearch = true;
                controller.update();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CustomIconWidget(
                  child: Icons.search,
                  size: 25,
                  color: whiteOnly,
                ),
              ),
            ),
            if(controller.isSearch)InkWell(
              onTap: (){
                controller.isSearch = false;
                controller.update();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CustomIconWidget(
                  child: Icons.clear,
                  size: 25,
                  color: whiteOnly,
                ),
              ),
            ),
          ],
          appBarBottomWidget: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: CentralizeButtonClass.scrollController,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: MyOrderStatusClass.myOrderStatusList.map((e){
                  int index = MyOrderStatusClass.myOrderStatusList.indexOf(e);
                  return Padding(
                    key: CentralizeButtonClass.buttonKeys[index],
                    padding: EdgeInsets.only(left: index == 0 ? 15 : 0, right: 15),
                    child: CustomTextButton(
                      textWidget: e["name"],
                      textFontSize: 13,
                      textColor: controller.activeButtonId == e["id"] ? blackOnly : whiteOnly,
                      backgroundColor: controller.activeButtonId == e["id"] ? whiteOnly: appSecondaryColor.withOpacity(0.2),
                      borderRadius: 20,
                      onPressed: (){
                        CentralizeButtonClass().centerButton(index);
                        controller.activeButtonId = e["id"]!;
                        controller.update();
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          body: Padding(
            padding: screenPadding(),
            child: ListView(
              children: [
                szW12(),
                ...controller.items.map((e){
                  int index = controller.items.indexOf(e);
                  return  Padding(
                    padding: EdgeInsets.only(bottom: 15, top: index == 0 ? 15 : 0),
                    child: MyOrderWidget(
                      imageUrl: e["image"],
                      productName: e["product_name"],
                      stock: e["stock"],
                      discountPrice: e["discount"],
                      productPrice: e["price"],
                      percentage: e["percentage"],
                      rating: e["rating"],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      }
    );
  }

}
