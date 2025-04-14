import 'package:ecommerce_app/utils/extensions/screen_padding.dart';
import 'package:ecommerce_app/utils/global/size_box.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_app_bar_widget.dart';
import 'package:ecommerce_app/view/widgets/custom_widgets/custom_icon_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../utils/theme/app_colors/basic_color.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product_details_screen';
  final dynamic rating = 2.5;
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSize = 1;
  int selectedColor = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back, color: Colors.white)),
        title: Text("Product", style: myTxt16(color: whiteOnly)),
        centerTitle: true,
        backgroundColor: appPrimaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined, color: Colors.white)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined, color: Colors.white)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xfff6f6f6),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/product_image/product_image.png',
                    height: 300,
                  ),
                ),
              ),
          
              SizedBox(height: 10),
          
              /// Product name
              Text(
                "Urban Blend Long Sleeve Shirt",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
          
              /// Product price
              Row(
                children: [
                  Text(
                    "\$185.00",
                    style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 10),
          
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xfff6f6f6),
                    ),
                    child: Text(
                      "2021 Sold",
                      style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(width: 10),
          
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3.8/10,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 1,
                        itemSize: 20.0,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        onRatingUpdate: (rating) {
                          if (kDebugMode) {
                            print(rating);
                          }
                        },
                      ),
                      SizedBox(width: 2),
                      Text("3.8", style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500))
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
          
              /// Vouchers Available
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Vouchers Available", style: myTxt15(fontWeight: FontWeight.w600),),
                  InkWell(
                    onTap: (){
          
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon(Icons.arrow_forward, ),
                        CustomIconWidget(
                          child: "assets/png/right-arrow.png",
                          height: 24,
                          color: appSecondaryColor,
                        ),
                        szW10(),
                        Text("View All", style: myTxt13(),),
                      ],
                    ),
                  ),
                ],
              ),
          
              SizedBox(
                height: 90,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xfff6f6f6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/discount.png',
                                height: 20,
                              ),
                              SizedBox(width: 5),
                              Text("Best Deal: 20% OFF", style: TextStyle(fontSize: 14, color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(height: 5),
          
                          Text("20DEALS, Min. Spend \$150, Valid till 10/10/2025", style: TextStyle(fontSize: 13, 
                              color: Colors.black.withOpacity(0.4),
                              fontWeight: FontWeight.w400)),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10);
                  },
                ),
              ),
              SizedBox(height: 8),
              Text("Size", style: myTxt15(fontWeight: FontWeight.w600)),
          
              /// Size
              SizedBox(
                height: 60,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index){
                    return InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: (){
                        setState(() {
                          selectedSize = index + 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: selectedSize == index + 1 ? null : Border.all(color: Colors.black.withOpacity(0.4)),
                          color: selectedSize == index + 1 ? appPrimaryColor : Colors.white,
                        ),
                        child: Text(index == 0 ? "XXL" :
                        index == 1 ? "XL" :
                        index == 2 ? "L" : 'S',
                            style: TextStyle(fontSize: 14, color: selectedSize == index + 1 ? Colors.white :
                                Colors.black, fontWeight: FontWeight.w500)),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 5);
                  },
                ),
              ),
          
          
              SizedBox(height: 8),
              Text("Colors", style: myTxt15(fontWeight: FontWeight.w600)),
          
              /// Colors
              SizedBox(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index){
                    return InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: (){
                        setState(() {
                          selectedColor = index + 1;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black.withOpacity(0.4)),
                              color: index == 0 ? Colors.black :
                              index == 1 ? Colors.white :
                              index == 2 ? Colors.brown :
                              index == 3 ? Colors.indigo :
                              Colors.blueGrey,
                            ),
                            child: selectedColor == index + 1 ? Icon(Icons.check) : null,
                          ),
                          SizedBox(height: 4),
          
                          Text(index == 0 ? "Black" :
                          index == 1 ? 'White' :
                          index == 2 ? 'Brown' :
                          index == 3 ? 'Indigo' :
                          'Blue Grey', style: TextStyle(fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10);
                  },
                ),
              ),
          
              /// Product Information
              Text("Product Information", style: myTxt15(fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
          
              Text("Material: 100% Acrylic"),
              Text("Care Label: Machine Washable"),
              Text("Neck: High Neck"),
              Text("Pattern: Solid"),
              SizedBox(height: 5),
              Text("Urban Blend shirt is a versatile addition. Slightly snug but stylish and well-made. Urban Blend shirt is a versatile addition. Slightly snug but stylish and well-made"),
              SizedBox(height: 10),
          
              /// Rating & Reviews
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rating & Reviews", style: myTxt15(fontWeight: FontWeight.w600),),
                  InkWell(
                    onTap: (){
          
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon(Icons.arrow_forward, ),
                        CustomIconWidget(
                          child: "assets/png/right-arrow.png",
                          height: 24,
                          color: appSecondaryColor,
                        ),
                        szW10(),
                        Text("View All", style: myTxt13(),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
          
              Column(
                children: [
                  Text("3.8", style: myTxt15(fontWeight: FontWeight.w600),),
                  RatingBar.builder(
                    initialRating: 3.8,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    onRatingUpdate: (rating) {
                      if (kDebugMode) {
                        print(rating);
                      }
                    },
                  ),
                  Text("2225 Rating, 200 Reviews", style: TextStyle(fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 10),
          
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      dense: true,
                      leading: CircleAvatar(backgroundImage: AssetImage('assets/profile_image/user_image.png')),
                      title: Text("Amelia Williams",
                      style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                      subtitle: Text("2 weeks ago", 
                          style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5), fontWeight: FontWeight.w500)),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined)),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 4,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20.0,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          onRatingUpdate: (rating) {
                            if (kDebugMode) {
                              print(rating);
                            }
                          },
                        ),
                        SizedBox(width: 10),
                        Text("4 stars",
                            style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5), fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Text("Variant: XL, White",
                        style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5), fontWeight: FontWeight.w400)),
                    Text("The item just arrived! Can't wait to try it this week. Hope it suits my style! 🔥",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w400)),
                  ],
                );
                },
                separatorBuilder: (context, _) => SizedBox(height: 10),
                itemCount: 2,
              ),
              SizedBox(height: 15),
          
              /// You May Also Like
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("You May Also Like", style: myTxt15(fontWeight: FontWeight.w600),),
                  InkWell(
                    onTap: (){
          
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon(Icons.arrow_forward, ),
                        CustomIconWidget(
                          child: "assets/png/right-arrow.png",
                          height: 24,
                          color: appSecondaryColor,
                        ),
                        szW10(),
                        Text("View All", style: myTxt13(),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
          
          
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 0.5, color: Colors.black.withOpacity(0.1)))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// Wishlist
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: (){
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appPrimaryColor.withOpacity(0.2),
                ),
                child: Icon(isFavorite ? Icons.favorite :
                Icons.favorite_border_outlined, color: appPrimaryColor),
              ),
            ),

            /// Buy Now
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: (){},
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: appPrimaryColor.withOpacity(0.2),
                ),
                child: Text("Buy Now",
                    style: TextStyle(fontSize: 15, color: appPrimaryColor, fontWeight: FontWeight.w500)),
              ),
            ),

            /// Add to Cart
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: (){},
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: appPrimaryColor,
                ),
                child: Text("Add to Cart",
                    style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

