import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../utils/extensions/screen_padding.dart';
import '../../../utils/style/app_style.dart';
import '../../../utils/theme/app_colors/all_colors_export.dart';
import 'custom_card_widget.dart';

class CustomSliverGridViewWidget extends StatefulWidget {
  final Function? fetchData;
  final Function? containerOnTap;
  final List<dynamic> items;
  final bool isLoading;
  final dynamic loadingWidget;
  final ScrollController scrollController;

  const CustomSliverGridViewWidget({
    this.fetchData,
    required this.items,
    required this.isLoading,
    this.loadingWidget,
    required this.scrollController,
    this.containerOnTap,
    super.key
  });

  @override
  State<CustomSliverGridViewWidget> createState() => _CustomSliverGridViewWidgetState();
}

class _CustomSliverGridViewWidgetState extends State<CustomSliverGridViewWidget> {


  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.scrollController.position.pixels == widget.scrollController.position.maxScrollExtent && !widget.isLoading) {
      if(widget.fetchData != null) widget.fetchData!();
    }
  }


  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        Row(
          children: [
            Text("All Items", style: myTxt15(fontWeight: FontWeight.w600),),
          ],
        ),
        szH10(),
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
                  if(widget.containerOnTap != null) widget.containerOnTap!();
                },
                child:  CustomCardWidget(
                  imageUrl: widget.items[index]["image"],
                  productName: widget.items[index]["product_name"],
                  stock: widget.items[index]["stock"],
                  discountPrice: widget.items[index]["discount"],
                  productPrice: widget.items[index]["price"],
                  percentage: widget.items[index]["percentage"],
                  rating: widget.items[index]["rating"],
                ),
              );
            },
            childCount: widget.items.length,
          ),
        ),
        if (widget.isLoading)
          Center(child: widget.loadingWidget),
          // SliverPositioned(
          //     bottom: 10,
          //     left: MediaQuery.of(context).size.width / 2,
          //     child: Center(child: widget.loadingWidget)
          // ),
        /*if(widget.isLoading)*/ SafeArea(top: false, child: SizedBox(),)
      ],
    );
  }
}
