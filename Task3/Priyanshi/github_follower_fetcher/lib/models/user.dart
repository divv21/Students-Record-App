class User {
  final String login;
  final String avatarUrl;
  final String name;

  User({required this.login, required this.avatarUrl, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      avatarUrl: json['avatar_url'],
      name: json['name'] ?? '',
    );
  }
}
