import 'package:get/get.dart';

import '../../../data/datasource/remote/dio/dio_client.dart';

class SplashController extends GetxController implements GetxService {
  final DioClient dioClient;

  SplashController({required this.dioClient});

}