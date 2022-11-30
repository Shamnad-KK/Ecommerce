class AddressModel {
  String? address;
  int? pincode;
  String? city;
  String? name;
  int? phone;
  String? id;

  AddressModel({
    required this.address,
    required this.pincode,
    required this.city,
    required this.name,
    required this.phone,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'address': address,
      'pincode': pincode,
      'city': city,
      'name': name,
      'phone': phone,
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> map) {
    return AddressModel(
      address: map['address'] ?? "0",
      pincode: map['pincode'] ?? 0,
      city: map['city'] ?? "0",
      name: map['name'] ?? '0',
      phone: map['phone'] ?? 0,
      id: map['_id'],
    );
  }
}
