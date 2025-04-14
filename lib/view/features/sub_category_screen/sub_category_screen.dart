import 'package:ecommerce_app/utils/extensions/screen_padding.dart';
import 'package:ecommerce_app/utils/global/centralize_button_class.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/view/features/sub_category_screen/sub_category_controller.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_icon_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../utils/theme/app_colors/basic_color.dart';
import '../../widgets/custom_widgets/custom_card_widget.dart';
import '../../widgets/custom_widgets/custom_scaffold_widget.dart';
import '../../widgets/custom_widgets/custom_text_form_field.dart';

class SubCategoryScreen extends StatefulWidget {
  static const String routeName = '/SubCategoryScreen';
  const SubCategoryScreen({super.key});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  final controller = Get.find<SubCategoryController>();
  bool _isLoading = false;

  List<String> subCatergoryButtonList = ["Pant", "Shirt", "Polo T-Shirt", "Joggers", "T-Shirt", "Jacket", "Coat", "Panjabi"];

  @override
  void initState() {
    // TODO: implement initState
    CentralizeButtonClass().initializeButtonKeys(subCatergoryButtonList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      body: NestedScrollView(
        floatHeaderSlivers: true, // Allows the SliverAppBar to float
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: true,
              automaticallyImplyLeading: true,
              iconTheme: IconThemeData(
                color: whiteOnly
              ),
              expandedHeight: 140.0,
              collapsedHeight: 35,
              toolbarHeight: 35,
              backgroundColor: appPrimaryColor,
              title: Text("Men's Fashion", style: myTxt15(color: whiteOnly, fontWeight: FontWeight.w600),),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                expandedTitleScale: 2,
                background: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: CustomTextFormField(
                            contentPaddingVertical: 8,
                            boarderRadius: 20,
                            focusBoarderColor: whiteOnly,
                            enabledBoarderColor: whiteOnly,
                            fillColor: whiteOnly,
                            hintText: "Search..",
                          ),
                        ),
                      ),
                      szW10(),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CustomContainerWidget(
                          height: 38,
                          width: 38,
                          shape: BoxShape.circle,
                          backGroundColor: appSecondaryColor,
                          backGroundColorOpacity: 0.1,
                          child: Center(
                            child: CustomIconWidget(
                              color: whiteOnly,
                              child: Icons.filter_alt,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: CentralizeButtonClass.scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 11),
                    child: Row(
                      children: subCatergoryButtonList.map((e){
                        int index = subCatergoryButtonList.indexOf(e);
                        return Padding(
                          key: CentralizeButtonClass.buttonKeys[index],
                          padding: EdgeInsets.only(left: index == 0 ? 15 : 0, right: 15),
                          child: CustomTextButton(
                            textWidget: e,
                            textFontSize: 13,
                            textColor: whiteOnly,
                            backgroundColor: appSecondaryColor.withOpacity(0.2),
                            borderRadius: 20,
                            onPressed: (){
                              CentralizeButtonClass().centerButton(index);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child:
                  CustomIconWidget(
                    child: Icons.add_shopping_cart,
                    color: Colors.white,
                    size: 21,
                  ),
                ),
              ],
            ),

          ];
        },
        body: Padding(
          padding: screenPadding(topPadding: 15),
          child: CustomScrollView(
            slivers: [
              SliverMasonryGrid(
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return  GestureDetector(
                      onTap: (){
                       // if(widget.containerOnTap != null) widget.containerOnTap!();
                      },
                      child:  CustomCardWidget(
                        imageUrl: controller.items[index]["image"],
                        productName: controller.items[index]["name"],
                        stock: controller.items[index]["stock"],
                        discountPrice: controller.items[index]["discount"],
                        productPrice: controller.items[index]["price"],
                        percentage: controller.items[index]["percentage"],
                        rating: controller.items[index]["rating"],
                      ),
                    );
                  },
                  childCount: controller.items.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
