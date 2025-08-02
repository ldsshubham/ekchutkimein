import 'package:constructo_user/api/otp_api.dart';
import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/routing/apppages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final mobileController = TextEditingController();
  final otpController = TextEditingController();
  var currentStep = 0.obs;
  var isMobileValid = false.obs;
  String? _serverOtp;

  /// Mobile number validation
  bool _isMobileValidFunction(String number) {
    final RegExp mobileNumber = RegExp(r'^[6-9]\d{9}$');
    final trimmed = number.trim();
    final valid = mobileNumber.hasMatch(trimmed);
    isMobileValid.value = valid;

    if (!valid) {
      Get.snackbar(
        "Mobile Number",
        "Enter a valid mobile number (e.g. 9876543210)",
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
    }

    return valid;
  }

  /// Request OTP
  Future<String?> requestOTP() async {
    final number = mobileController.text.trim();
    // final number = "+91${mobileController.text.trim()}";
    if (!_isMobileValidFunction(number)) return null;
    print("➡️ Requesting OTP for number: $number");
    try {
      final otp = await OtpApiServices.requestOTP(number);
      otpController.text = otp;
      _serverOtp = otp;
      otpController.clear();

      Get.snackbar(
        "OTP Sent",
        "OTP Sent to you is: $otp",
        backgroundColor: AppColors.green,
        colorText: AppColors.white,
      );
      goToNextStep();
      return otp;
    } catch (e, stackTrace) {
      print("❌ Exception caught: $e");
      print("📛 StackTrace: $stackTrace");
      Get.snackbar(
        "Error",
        e.toString().replaceFirst('Exception: ', ''),
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
      return null;
    }
  }

  void verifyOtp(String enteredOtp) async {
    if (_serverOtp == null) {
      Get.snackbar(
        "Error",
        'Please resend OTP',
        backgroundColor: AppColors.warning,
        colorText: AppColors.white,
      );
      return;
    }
    if (enteredOtp == _serverOtp) {
      Get.snackbar(
        "Success",
        "OTP Verified Successfully!",
        backgroundColor: AppColors.green,
        colorText: AppColors.white,
      );
      Get.offNamed(AppRoutes.home);
    } else {
      Get.snackbar(
        'Error',
        "OTP that you entered in incorrect",
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
      return;
    }
  }

  /// Step controller
  void goToNextStep() {
    currentStep.value++;
  }
}
