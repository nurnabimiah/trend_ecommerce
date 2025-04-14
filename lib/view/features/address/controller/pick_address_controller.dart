

import 'package:get/get.dart';

class PickAddressController extends GetxController{

  RxInt selectedIndex = 0.obs;

  void selectedAddress(int index){
    selectedIndex.value = index;
  }

}