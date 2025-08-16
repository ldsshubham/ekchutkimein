import 'package:constructo_user/src/features/profile/models/profile_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api/profile_api.dart' show ProfileApi;

class ProfileController extends GetxController {
  var userProfile = Rxn<UserProfile>();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void refreshProfile() {
    fetchProfile();
  }

  void fetchProfile() async {
    try {
      isLoading.value = true;
      final box = GetStorage();
      final token = box.read('accessToken') ?? '';
      print('Token mil gaya 🎯🎯🎯🎯🎯🎯🎯🎯🎯🎯 $token');
      if (token.isEmpty) {
        throw Exception('Token is empty. Please log in again.');
      }
      final result = await ProfileApi.fetchProfile(token);
      userProfile.value = result;
      print('Profile fetched successfully: ${userProfile.value}');
      print(result);
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
