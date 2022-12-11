class HomeCategoryModel {
  final String id;
  final String name;
  final String image;
  HomeCategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      id: json['_id'] ?? "0",
      name: json['category'] ?? "No category",
      image: json['icon'] ?? "No image",
    );
  }
}
