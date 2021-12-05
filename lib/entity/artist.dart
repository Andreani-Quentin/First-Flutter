class Artist {
  final int id;
  final String name;
  final String description;
  final String image;

  Artist(this.id, this.name, this.description, this.image);

  Artist.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        description = json['description'],
        image = json['image'];

  Map<String, dynamic> toJson() => {'description': description, 'name': name, 'image': image, 'id': id};
}
