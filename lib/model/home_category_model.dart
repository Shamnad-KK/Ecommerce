class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  final String id;
  final String name;
  final String image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
      );
}
