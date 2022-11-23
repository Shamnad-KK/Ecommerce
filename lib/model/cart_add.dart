class CartModel {
  final String productId;
  final int? quantity;
  final String color;
  final dynamic size;
  CartModel({
    required this.productId,
    this.quantity,
    required this.color,
    required this.size,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'productId': productId,
      'quantity': quantity,
      'color': color,
      'size': size,
    };
  }
}
