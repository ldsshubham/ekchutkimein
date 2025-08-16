class UserProfile {
  final int id;
  final String mobileNumber;

  UserProfile({required this.id, required this.mobileNumber});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(id: json['id'], mobileNumber: json['phone'] ?? '');
  }
}
