import 'package:get/get.dart';

class CartController extends GetxController{
 var count = 0.obs;

 void increaseCount(count){
  count ++;
 }
 void decreaseCount(count){
  if(count>0) count--;
 }
}