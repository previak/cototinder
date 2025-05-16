class CatBreed {
  final String id;
  final String imageUrl;
  final String breedName;
  final String description;
  final DateTime likedDate;

  CatBreed({
    required this.id,
    required this.imageUrl,
    required this.breedName,
    required this.description,
    required this.likedDate,
  });

  CatBreed copyWith({
    String? id,
    String? imageUrl,
    String? breedName,
    String? description,
    DateTime? likedDate,
  }) {
    return CatBreed(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      breedName: breedName ?? this.breedName,
      description: description ?? this.description,
      likedDate: likedDate ?? this.likedDate,
    );
  }
}
