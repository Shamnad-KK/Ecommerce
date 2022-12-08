class Carrousals {
  Carrousals({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.offer,
  });

  String id;
  String title;
  String image;
  String description;
  int offer;

  factory Carrousals.fromJson(Map<String, dynamic> json) => Carrousals(
        id: json["_id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        offer: json["offer"],
      );
}
