class Account {
  String? id;
  final String name;
  final String password;
  final String phone;
  final String email;

  Account(
      {this.id,
      required this.name,
      required this.password,
      required this.email,
      required this.phone});
}
