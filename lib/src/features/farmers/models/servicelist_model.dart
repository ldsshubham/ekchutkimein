class ServicelistModel {
  final String status;
  final String message;
  final List<Service> data;
  final dynamic error;

  ServicelistModel({
    required this.status,
    required this.message,
    required this.data,
    required this.error,
  });

  factory ServicelistModel.fromJson(Map<String, dynamic> json) {
    return ServicelistModel(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List<dynamic>)
          .map((e) => Service.fromJson(e))
          .toList(),
      error: json['errors'] ?? "Error are not sure",
    );
  }
}

class Service {
  final int id;
  final String vendorname;
  final String servicename;
  final String servicedesc;
  final String serviceprice;
  final String unit;
  final String location;

  Service({
    required this.id,
    required this.vendorname,
    required this.servicename,
    required this.servicedesc,
    required this.serviceprice,
    required this.unit,
    required this.location,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      vendorname: json['vendor_name'] ?? "No Vendor",
      servicename: json['name'] ?? "No Name",
      servicedesc: json['description'],
      serviceprice: json['price'],
      unit: json['unit'],
      location: json['location'],
    );
  }
}
