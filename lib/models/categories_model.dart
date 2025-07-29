class Categories {
  final int cId;
  final String cName;
  final String? cImg;
  Categories({required this.cName, this.cImg, required this.cId});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(cName: json['name'], cImg: json['img'], cId: json['id']);
  }
}
