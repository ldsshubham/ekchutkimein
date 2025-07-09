import 'package:get/get.dart';

class SignupController extends GetxController{
  var currentStep= 0.obs;
  void gotoNextStep(){
    currentStep.value++;
  }
}