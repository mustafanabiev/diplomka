class PlantModel {
  final int id; // Добавьте уникальный идентификатор
  final String image;
  final String name;
  final String description;
  final bool isFavorites;
  final String text;

  const PlantModel({
    required this.id, // Добавьте уникальный идентификатор
    required this.image,
    required this.name,
    required this.description,
    required this.isFavorites,
    required this.text,
  });

  PlantModel copyWith({
    int? id,
    String? image,
    String? name,
    String? description,
    bool? isFavorites,
    String? text,
  }) {
    return PlantModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
      isFavorites: isFavorites ?? this.isFavorites,
      text: text ?? this.text,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          image == other.image &&
          name == other.name &&
          description == other.description &&
          isFavorites == other.isFavorites;

  @override
  int get hashCode =>
      id.hashCode ^
      image.hashCode ^
      name.hashCode ^
      description.hashCode ^
      isFavorites.hashCode;
}
