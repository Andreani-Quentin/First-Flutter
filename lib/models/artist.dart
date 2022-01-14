class Artist {
  final int id;
  final String name;
  final String description;
  final String image;

  Artist({required this.id, required this.name, required this.description, required this.image});

  // @override
  // String toString() {
  //   return 'Artist{id: $id, name: $name, description: $description, image: $image}';
  // }

  factory Artist.fromJson(dynamic json) {
    return Artist(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        image: json['image'] as String
    );
  }

  static List<Artist> artistsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Artist.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Artist{id: $id, name: $name, description: $description, image: $image}';
  }
}
