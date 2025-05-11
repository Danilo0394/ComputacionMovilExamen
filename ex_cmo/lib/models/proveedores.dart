

class Proveedor {
  final int id;
  final String name;
  final String contact;
  final String address;

  Proveedor({required this.id, required this.name, required this.contact, required this.address});

  factory Proveedor.fromJson(Map<String, dynamic> json) {
    return Proveedor(
      id: json['proveedor_id'],
      name: json['proveedor_name'],
      contact: json['proveedor_contact'],
      address: json['proveedor_address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'proveedor_id': id,
      'proveedor_name': name,
      'proveedor_contact': contact,
      'proveedor_address': address,
    };
  }
}