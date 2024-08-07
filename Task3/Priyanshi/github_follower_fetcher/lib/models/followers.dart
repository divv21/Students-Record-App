class Follower {
  final String login;
  final String avatarUrl;

  Follower({required this.login, required this.avatarUrl});

  factory Follower.fromJson(Map<String, dynamic> json) {
    return Follower(
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}
