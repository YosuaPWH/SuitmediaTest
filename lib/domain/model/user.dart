class User {
  int id = 0;
  String email = "";
  String firstName = "";
  String lastName = "";
  String avatar = "";

  User({required this.id, required this.email, required this.firstName, required this.lastName, required this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}
