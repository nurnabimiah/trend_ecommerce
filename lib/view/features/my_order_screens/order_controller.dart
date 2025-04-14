import 'package:ecommerce_app/utils/global/my_order_status_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/remote/dio/dio_client.dart';
import '../../../data/repositories/remote/login_repo.dart';
import '../../../data/repositories/remote/order_repo.dart';
import '../../../utils/global/order_details_class.dart';

class OrderController extends GetxController {
  DioClient dioClient;
  OrderRepo orderRepo;

  OrderController({required this.dioClient, required this.orderRepo});

  bool isSearch = false;
  String activeButtonId = MyOrderStatusClass.activeId;
  String orderTrackViewButton = OrderDetailsClass.trackOrderName;

  List<dynamic> items = [
    {
      "image": "assets/client_slider/1.jpg",
      "product_name": "Apple 16",
      "discount": "10",
      "rating": "3",
      "stock": "0",
      "price": "100",
      "percentage": "10",
    },
    {
      "image": "assets/client_slider/0.jpg",
      "product_name": "Samsung S Ultra",
      "discount": "10",
      "rating": "4",
      "stock": "200",
      "price": "100",
      "percentage": "15",
    },
    {
      "image": "assets/client_slider/1.jpg",
      "product_name": "Dell Monitor",
      "discount": "10",
      "rating": "4.5",
      "stock": "80",
      "price": "100",
      "percentage": "5",
    },
    {
      "image": "assets/client_slider/2.jpg",
      "product_name": "Fashion Clothes Half Sleeve",
      "discount": "10",
      "rating": "4.8",
      "stock": "50",
      "price": "200",
      "percentage": "50",
    },
    {
      "image": "assets/client_slider/1.jpg",
      "product_name": "Product  name 2",
      "discount": "10",
      "rating": "3.5",
      "stock": "10",
      "price": "100",
      "percentage": "30",
    },
    {
      "image": "assets/client_slider/2.jpg",
      "product_name": "Product  name 2",
      "discount": "10",
      "rating": "4.5",
      "stock": "100",
      "price": "100",
      "percentage": "60",
    },
    {
      "image": "assets/client_slider/0.jpg",
      "product_name": "Product  dfdf dfd fd fdf df df d name 2",
      "discount": "10",
      "rating": "5",
      "stock": "10",
      "price": "100",
      "percentage": "40",
    },
  ];


  // fetching order dta
  fetchingOrderData(String data){

  }

}