import 'package:get/get.dart';

class LoginController extends GetxController{
  var currentStep = 0.obs;
  void goToNextStep(){
    currentStep.value++;
  }
}