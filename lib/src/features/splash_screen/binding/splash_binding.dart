import 'package:get/get.dart';
import '../controllers/splashcontroller.dart';

class SplashBinding extends Bindings{
  @override  
  void dependencies(){
     print("🧩 SplashBinding triggered");
    Get.lazyPut<SplashController>(()=>SplashController());
  }
}