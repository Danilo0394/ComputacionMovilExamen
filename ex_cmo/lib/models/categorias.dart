
class Category {
  final int id;
  final String name;
  final String description;

  Category({required this.id, required this.name, required this.description});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['product_id'],            
      name: json['product_name'],        
      description: json['product_state'] 
    );
  }
}
