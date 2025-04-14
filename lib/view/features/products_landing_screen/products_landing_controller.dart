import 'package:ecommerce_app/data/repositories/remote/products_landing_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/remote/dio/dio_client.dart';
import '../../../data/repositories/remote/category_repo.dart';
import '../../../data/repositories/remote/login_repo.dart';

class ProductsLandingController extends GetxController {
  DioClient dioClient;
  ProductsLandingRepo productsLandingRepo;

  ProductsLandingController({required this.dioClient, required this.productsLandingRepo});

  String appBarTitle = "All Products";
  final searchController = TextEditingController();

  List<dynamic> items = [
    {
      "id": "1",
      "image": "assets/client_slider/1.jpg",
      "name": "Apple 16",
      "discount": "10",
      "rating": "3",
      "stock": "0",
      "price": "100",
      "percentage": "10",
      "sub_category": [
        {
          "id": "1",
          "name": "Pants",
        },
        {
          "id": "2",
          "name": "Shirts",
        },
        {
          "id": "3",
          "name": "Full Sleeve Shirts",
        },
      ],
    },
    {
      "id": "2",
      "image": "assets/client_slider/0.jpg",
      "name": "Samsung S Ultra",
      "discount": "10",
      "rating": "4",
      "stock": "200",
      "price": "100",
      "percentage": "15",
      "sub_category": [
        {
          "id": "1",
          "name": "Saree",
        },
        {
          "id": "2",
          "name": "Three pics",
        },
        {
          "id": "3",
          "name": "Hijab",
        },
      ],
    },
    {
      "id": "3",
      "image": "assets/client_slider/1.jpg",
      "name": "Dell Monitor",
      "discount": "10",
      "rating": "4.5",
      "stock": "80",
      "price": "100",
      "percentage": "5",
      "sub_category": [
        {
          "id": "1",
          "name": "Pants",
        },
        {
          "id": "2",
          "name": "Shirts",
        },
        {
          "id": "3",
          "name": "Full Sleeve Shirts",
        },
      ],
    },
    {
      "id": "4",
      "image": "assets/client_slider/2.jpg",
      "name": "Fashion Clothes Half Sleeve",
      "discount": "10",
      "rating": "4.8",
      "stock": "50",
      "price": "200",
      "percentage": "50",
      "sub_category": [
        {
          "id": "1",
          "name": "Saree",
        },
        {
          "id": "2",
          "name": "Three pics",
        },
        {
          "id": "3",
          "name": "Hijab",
        },
      ],
    },
    {
      "id": "5",
      "image": "assets/client_slider/1.jpg",
      "name": "Product  name 2",
      "discount": "10",
      "rating": "3.5",
      "stock": "10",
      "price": "100",
      "percentage": "30",
      "sub_category": [
        {
          "id": "1",
          "name": "Pants",
        },
        {
          "id": "2",
          "name": "Shirts",
        },
        {
          "id": "3",
          "name": "Full Sleeve Shirts",
        },
      ],
    },
    {
      "id": "6",
      "image": "assets/client_slider/2.jpg",
      "name": "Product  name 2",
      "discount": "10",
      "rating": "4.5",
      "stock": "100",
      "price": "100",
      "percentage": "60",
      "sub_category": [
        {
          "id": "1",
          "name": "Saree",
        },
        {
          "id": "2",
          "name": "Three pics",
        },
        {
          "id": "3",
          "name": "Hijab",
        },
      ],
    },
    {
      "id": "7",
      "image": "assets/client_slider/0.jpg",
      "name": "Product  dfdf dfd fd fdf df df d name 2",
      "discount": "10",
      "rating": "5",
      "stock": "10",
      "price": "100",
      "percentage": "40",
      "sub_category": [
        {
          "id": "1",
          "name": "Pants",
        },
        {
          "id": "2",
          "name": "Shirts",
        },
        {
          "id": "3",
          "name": "Full Sleeve Shirts",
        },
      ],
    },
    {
      "id": "8",
      "image": "assets/client_slider/1.jpg",
      "name": "Product  dfdf dfd fd fdf df df d name 2",
      "discount": "10",
      "rating": "5",
      "stock": "10",
      "price": "100",
      "percentage": "40",
      "sub_category": [
        {
          "id": "1",
          "name": "Pants",
        },
        {
          "id": "2",
          "name": "Shirts",
        },
        {
          "id": "3",
          "name": "Full Sleeve Shirts",
        },
      ],
    },
    {
      "id": "9",
      "image": "assets/client_slider/2.jpg",
      "name": "Product  dfdf dfd fd fdf df df d name 2",
      "discount": "10",
      "rating": "5",
      "stock": "10",
      "price": "100",
      "percentage": "40",
      "sub_category": [
        {
          "id": "1",
          "name": "Pants",
        },
        {
          "id": "2",
          "name": "Shirts",
        },
        {
          "id": "3",
          "name": "Full Sleeve Shirts",
        },
      ],
    },
    {
      "id": "10",
      "image": "assets/client_slider/2.jpg",
      "name": "Product  dfdf dfd fd fdf df df d name 2",
      "discount": "10",
      "rating": "5",
      "stock": "10",
      "price": "100",
      "percentage": "40",
      "sub_category": [
        {
          "id": "1",
          "name": "Pants",
        },
        {
          "id": "2",
          "name": "Shirts",
        },
        {
          "id": "3",
          "name": "Full Sleeve Shirts",
        },
      ],
    },
    {
      "id": "11",
      "image": "assets/client_slider/1.jpg",
      "name": "Product  dfdf dfd fd fdf df df d name 2",
      "discount": "10",
      "rating": "5",
      "stock": "10",
      "price": "100",
      "percentage": "40",
      "sub_category": [
        {
          "id": "1",
          "name": "Pants",
        },
        {
          "id": "2",
          "name": "Shirts",
        },
        {
          "id": "3",
          "name": "Full Sleeve Shirts",
        },
      ],
    },
  ];
  List<dynamic> subCategoryList = [];

}