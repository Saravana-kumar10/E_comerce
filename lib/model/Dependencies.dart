import 'package:get/get.dart';

import 'package:e_comercesara/netcheck.dart';

class DependencyInjection {

  static void init() {
    Get.put<NetworkController>(NetworkController(),permanent:true);
  }
}