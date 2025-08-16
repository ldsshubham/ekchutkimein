// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api/otp_api.dart';
import '../../../constants/app_colors.dart';
import '../../../routing/apppages.dart';

class LoginController extends GetxController {
  final mobileController = TextEditingController();
  final otpController = TextEditingController();
  var currentStep = 0.obs;
  var isMobileValid = false.obs;
  String? _serverOtp;

  bool _isMobileValidFunction(String number) {
    final RegExp mobileNumber = RegExp(r'^\+?[6-9]\d{9}$');
    final trimmed = number.trim();
    final valid = mobileNumber.hasMatch(trimmed);

    if (!valid) {
      Get.snackbar(
        "Mobile Number",
        'Enter a valid mobile number (e.g. 9876543210)',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
    }
    return valid;
  }

  Future<String?> requestOtp() async {
    final number = mobileController.text;

    if (!_isMobileValidFunction(number)) return null;

    try {
      print("Requesting OTP for: $number");
      final otp = await OtpApiServices.requestOTP(number);
      otpController.text = otp;
      _serverOtp = otp;
      otpController.clear();

      Get.snackbar(
        "OTP Request",
        'OTP sent to $number: $otp',
        backgroundColor: AppColors.green,
        colorText: AppColors.white,
      );
      goToNextStep();
      print("OTP requested successfully: $otp");
      return otp;
    } catch (e, stackTrace) {
      print("❌ Exception caught: $e");
      print("📛 StackTrace: $stackTrace");
      Get.snackbar(
        "OTP Request Error",
        'Failed to send OTP. Please try again. $e',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
      return null;
    }
  }

  Future<String?> verifyOtpAndSaveOtp(String otp) async {
    if (!_isMobileValidFunction(mobileController.text)) return null;
    print("Verifying OTP for: ${mobileController.text} with OTP: $otp");
    try {
      final accessToken = await OtpApiServices.verifyOtp(
        mobileController.text,
        otp,
      );
      if (otp == _serverOtp) {
        print("OTP verified successfully: $accessToken");
        // Save the access token to local storage
        GetStorage().write('accessToken', accessToken).then((_) {
          print("Access token save successfully $accessToken");
        });
        if (GetStorage().read("accessToken") == accessToken) {
          print(
            'Access token is saved successfully 👍👍👍👍👍👍👍👍👍👍👍👍👍👍',
          );
        }

        Get.snackbar(
          "OTP Verification",
          'OTP verified successfully',
          backgroundColor: AppColors.green,
          colorText: AppColors.white,
        );
        Get.toNamed(AppRoutes.home);
        return accessToken;
      } else {
        Get.snackbar(
          "OTP Verification Error",
          'Invalid OTP. Please try again.',
          backgroundColor: AppColors.error,
          colorText: AppColors.white,
        );
        return null;
      }
    } catch (e) {
      print("❌ Exception caught: $e");
      Get.snackbar(
        "OTP Verification Error",
        'Failed to verify OTP. Please try again.',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
      return null;
    }
  }

  void logOutUser() {
    final storage = GetStorage();
    try {
      storage.erase();
      Get.offAllNamed(AppRoutes.mainLoginSign);
      Get.snackbar(
        "Logout",
        'You have been logged out successfully',
        backgroundColor: AppColors.green,
        colorText: AppColors.white,
      );
    } catch (e) {
      print("Error during logout: $e");
      Get.snackbar(
        "Logout Error",
        'Failed to log out. Please try again.',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
    }
  }

  void goToNextStep() {
    currentStep.value++;
  }
}
