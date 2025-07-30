class CategoryModel {
  final int cId;
  final String cName;
  final String? cImg;
  CategoryModel({required this.cName, this.cImg, required this.cId});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      cName: json['name'],
      cImg: json['img'],
      cId: json['id'],
    );
  }
}
