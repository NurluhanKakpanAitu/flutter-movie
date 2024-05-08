class UserAccount{
  final String? email;
  final String? password;

  UserAccount({required this.email, required this.password});


  static UserAccount fromJson(Map<String, dynamic> json) {
    return UserAccount(
      email: json['email'],
      password: json['password'],
    );
  }
}