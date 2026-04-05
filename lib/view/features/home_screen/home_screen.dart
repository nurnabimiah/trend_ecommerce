
import 'package:ecommerce_app/utils/extensions/screen_padding.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/view/features/home_screen/widgets/best_selling_home_screen_widget.dart';
import 'package:ecommerce_app/view/features/product_details/product_details_screen.dart';
import 'package:ecommerce_app/view/features/products_landing_screen/products_landing_controller.dart';
import 'package:ecommerce_app/view/features/products_landing_screen/products_landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/style/app_style.dart';
import '../../../utils/theme/app_colors/basic_color.dart';
import 'widgets/category_home_screen_widget.dart';
import '../../widgets/custom_widgets/custom_scaffold_widget.dart';
import '../../widgets/custom_widgets/custom_sliver_grid_view_widget.dart';
import '../../widgets/custom_widgets/custom_text_form_field.dart';



class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final productLandingController = Get.find<ProductsLandingController>();
  List<dynamic> items = [
    {
      "image": "assets/product_image/product_image.png",
      "product_name": "Apple 16",
      "discount": "10",
      "rating": "3",
      "stock": "0",
      "price": "100",
      "percentage": "10",
    },
    {
      "image": "assets/product_image/product_image.png",
      "product_name": "Samsung S Ultra",
      "discount": "10",
      "rating": "4",
      "stock": "200",
      "price": "100",
      "percentage": "15",
    },
    {
      "image": "assets/product_image/product_image.png",
      "product_name": "Dell Monitor",
      "discount": "10",
      "rating": "4.5",
      "stock": "80",
      "price": "100",
      "percentage": "5",
    },
    {
      "image": "assets/product_image/product_image.png",
      "product_name": "Fashion Clothes Half Sleeve",
      "discount": "10",
      "rating": "4.8",
      "stock": "50",
      "price": "200",
      "percentage": "50",
    },
    {
      "image": "assets/product_image/product_image.png",
      "product_name": "Product  name 2",
      "discount": "10",
      "rating": "3.5",
      "stock": "10",
      "price": "100",
      "percentage": "30",
    },
    ///
    {
      "image": "assets/product_image/product_image.png",
      "product_name": "Product  name 2",
      "discount": "10",
      "rating": "4.5",
      "stock": "100",
      "price": "100",
      "percentage": "60",
    },
    {
      "image": "assets/product_image/product_image.png",
      "product_name": "Product  dfdf dfd fd fdf df df d name 2",
      "discount": "10",
      "rating": "5",
      "stock": "10",
      "price": "100",
      "percentage": "40",
    },
  ];
  bool _isLoading = false;
  int _currentPage = 1;
  final int _itemsPerPage = 20;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey ke1 = GlobalKey();
  final GlobalKey ke2 = GlobalKey();
  int _activeIndex = 0;
  void setActiveIndexValue(int index){
    _activeIndex = index;
    setState(() {

    });
  }

  Future<void> _loadMoreData() async {
    setState(() {
      _isLoading = true;
    });
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));

    setState(() {

      items.addAll(List.generate(
          _itemsPerPage, (index) => 'Item ${index + (_currentPage * _itemsPerPage)}'));
      _currentPage++;
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      scaffoldBackGroundColor: appBackGroundColor,
      body: GestureDetector(
        onTap: (){},
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [

            SliverAppBar(
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: appPrimaryColor,
              toolbarHeight: 0,
              expandedHeight: 116,
              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14, 16, 12, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your App Name',
                          style: myTxt16(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("ontap....");
                          },
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(68),
                child: Container(
                  height: 68,
                  color: appPrimaryColor,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: CustomTextFormField(
                    controller: productLandingController.searchController,
                    contentPaddingVertical: 10,
                    boarderRadius: 18.r,
                    focusBoarderColor: whiteOnly,
                    enabledBoarderColor: whiteOnly,
                    fillColor: whiteOnly,
                    hintText: "Search..",
                    onFieldSubmit: (value) {
                      Get.toNamed(ProductsLandingScreen.routeName);
                    },
                    onSubmit: (value) {
                      Get.toNamed(ProductsLandingScreen.routeName);
                    },
                  ),
                ),
              ),
            ),


            SliverToBoxAdapter(
                child: szH30(),
            ),

            SliverToBoxAdapter(
              child: CategoryHomeScreenWidget(
                items: items,
              ),
            ),
            SliverToBoxAdapter(
              child: szH8(),
            ),


            SliverToBoxAdapter(
              child: BestSellingHomeScreenWidget(
                items: items,
              ),
            ),
            SliverToBoxAdapter(
              child: szH30(),
            ),

            SliverPadding(
              padding: screenPadding(),
              sliver: CustomSliverGridViewWidget(
                containerOnTap: (){
                  Get.toNamed(ProductDetailsScreen.routeName);
                },
                isLoading: _isLoading,
                scrollController: _scrollController,
                items: items,
                fetchData: (){
                  //_loadMoreData();
                },
                loadingWidget: CircularProgressIndicator(),
              ),
            ),

          ],
        ),
      ),

    );

  }

}




