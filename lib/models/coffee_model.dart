class CoffeeModel {
  final String id;
  final String title;
  final String description;
  final List<String> ingredients;
  final String type;
  final String imageUrl;

  CoffeeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.type,
    this.imageUrl = '',
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? 'Unknown Coffee',
      description: json['description'] ?? 'No description',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      type: json['type'] ?? 'unknown',
      imageUrl: json['image'] ?? '',
    );
  }
}