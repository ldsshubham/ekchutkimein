class AddressResponse {
  final String status;
  final String message;
  final List<Address> data;

  AddressResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Address.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Address {
  final int id;
  final int userId;
  final String name;
  final String? phone;
  final String type;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String zip;
  final String country;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  Address({
    required this.id,
    required this.userId,
    required this.name,
    this.phone,
    required this.type,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'] ?? '',
      phone: json['phone'],
      type: json['type'] ?? '',
      addressLine1: json['addressline1'] ?? '',
      addressLine2: json['addressline2'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zip: json['zip'] ?? '',
      country: json['country'] ?? '',
      isActive: json['is_active'] ?? false,
      createdAt: DateTime.parse(json['created_at'] ?? json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_id": userId,
      "name": name,
      "phone": phone,
      "type": type,
      "addressline1": addressLine1,
      "addressline2": addressLine2,
      "city": city,
      "state": state,
      "zip": zip,
      "country": country,
      "is_active": isActive,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}
