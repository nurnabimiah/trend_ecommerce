import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/remote/dio/dio_client.dart';
import '../../../data/repositories/remote/login_repo.dart';

class HomeController extends GetxController {
  DioClient dioClient;
  LoginRepo loginRepo;

  HomeController({required this.dioClient, required this.loginRepo});



}