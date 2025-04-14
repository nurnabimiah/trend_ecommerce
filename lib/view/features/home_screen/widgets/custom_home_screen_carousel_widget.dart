import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/theme/app_colors/basic_color.dart';

class CustomHomeScreenCarouselWidget extends StatefulWidget {
  final List<dynamic> items;
  final Function? onTap;
  const CustomHomeScreenCarouselWidget({
    required this.items,
    this.onTap,
    super.key
  });

  @override
  State<CustomHomeScreenCarouselWidget> createState() => _CustomHomeScreenCarouselWidgetState();
}

class _CustomHomeScreenCarouselWidgetState extends State<CustomHomeScreenCarouselWidget> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            if(widget.onTap != null) widget.onTap!();
          },
          child: Center(
            child: CarouselSlider(
              options: CarouselOptions(
                //   height: MediaQuery.of(context).size.height * .35,
                 aspectRatio: 16 / 5,
                  //aspectRatio: 2,
                  // viewportFraction: 0.9,
                  // initialPage: 2,
                  // enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayCurve: Curves.ease,
                  //enlargeCenterPage: true,
                  //scrollDirection: Axis.horizontal,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason){
                    setState(() {
                      activeIndex = index;
                    });
                  }
              ),
              items: widget.items.map((index) {
                return Builder(builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: (){
                        //print("ball....");
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.height * 0.9,
                            //color: Colors.green,
                            child: Image.asset(index,  fit: BoxFit.fitWidth,)
                        ),
                      ),
                    ),
                  );
                });
              }).toList(),
            ),
          ),
        ),

        SizedBox(height: 10,),

        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.items.length,
          effect: SlideEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: appSecondaryColor,
            dotColor: appSecondaryColor.withOpacity(0.2)
          ),
        ),
      ],
    );
  }
}
