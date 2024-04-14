class UserModel {
  final String? id;
  final String firstName;
  final String? lastName;
  final String? phone;
  final String email;

  UserModel(
      {this.id, required this.firstName, this.lastName, required this.phone, required this.email});

  toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "email": email
    };
  }
}
