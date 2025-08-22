class ProductImageModel {
  final int? id;
  final String? imgName;
  final String? imgPath;

  ProductImageModel({this.id, this.imgName, this.imgPath});
  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      id: json['id'],
      imgName: json['name'],
      imgPath: json['url'],
    );
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "imgName": imgName, "imgPath": imgPath};
  }
}
