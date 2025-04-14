import 'package:ecommerce_app/utils/extensions/screen_padding.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/view/features/category_screen/category_controller.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_circular_image_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme/app_colors/basic_color.dart';
import '../../widgets/custom_widgets/custom_scaffold_widget.dart';
import '../sub_category_screen/sub_category_screen.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = '/CategoryScreen';
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final controller = Get.find<CategoryController>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      isAppBar: true,
      appBarTitle: "Categories",
      body: Row(
        children: [
          SizedBox(
            width: 100,
            child: GetBuilder<CategoryController>(
              builder: (controller) {
                return ListView(
                  children: controller.items.map((e){
                    int index = controller.items.indexOf(e);
                    return  InkWell(
                      onTap: (){
                        controller.categoryId = e["id"];
                        controller.subCategoryList = e["sub_category"];
                        controller.update();
                      },
                      child: CustomContainerWidget(
                        isOnlyMargin: true,
                        bottomMargin: 3,
                        backGroundColor: controller.categoryId == e["id"] ? appPrimaryColor : appSecondaryColor,
                        backGroundColorOpacity: controller.categoryId == e["id"] ? 0.4 : 0.2 ,
                        isOnlyBorderRadius: true,
                        topRightBorderRadius: /*index == 0 ? 0 : */10,
                        bottomRightBorderRadius: /*index == controller.items.length -1 ? 0 : */10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CustomCircularImageWidget(
                                cacheImageUrl: e["image"],
                              ),
                              Text(e["name"], maxLines: 3, overflow: TextOverflow.ellipsis, style: myTxt12(),),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            ),
          ),
          subCategoryContent(),
        ],
      ),
    );
  }

  subCategoryContent(){
    return Expanded(
      child: GetBuilder<CategoryController>(
          builder: (controller) {
          return InkWell(
            onTap: (){
              Get.toNamed(SubCategoryScreen.routeName);
            },
            child: Padding(
              padding: screenPadding(topPadding: 15),
              child: ListView.separated(
                itemCount: controller.subCategoryList.length,
                 separatorBuilder: (BuildContext context, int index) => Padding(padding: EdgeInsets.only(top: 15)),
                  itemBuilder: (BuildContext context, int index) {
                  return CustomContainerWidget(
                    padding: 16,
                    isAllBoarderRadius: true,
                    //backGroundColor: index == 0 ? appPrimaryColor : appSecondaryColor,
                    backGroundColor: index == 0 ? appSecondaryColor : whiteOnly,
                    backGroundColorOpacity: index == 0 ? 0.15 : 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.subCategoryList[index]["name"], maxLines: 1, overflow: TextOverflow.ellipsis, style: myTxt14(),),
                        CustomIconWidget(
                          child: Icons.arrow_forward_ios_rounded,
                        ),
                      ],
                    ),
                  );
                },),
            ),
          );
        }
      ),
    );
  }

}
