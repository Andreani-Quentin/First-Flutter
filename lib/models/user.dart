class User {
  final int id;
  final String username;
  final String email;

  User(this.id,this.username,this.email);

  User.fromJson(Map<String, dynamic> json):
      id = json['id'],
      username = json['username'],
      email = json['email'];

  Map<String, dynamic> toJson() => {
    'username' : username,
    'email' : username,
    'id' : id
  };

}