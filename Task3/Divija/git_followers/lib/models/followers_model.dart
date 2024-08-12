/**class FollowersModel {
  FollowersModel({
      String? login,
      String? avatarUrl,}){
    _login = login;
    _avatarUrl = avatarUrl;
}


  FollowersModel.fromJson(dynamic json) {
    _login = json['login'];
    _avatarUrl = json['avatar_url'];}
  String? _login;
  String? _avatarUrl;
FollowersModel copyWith({  String? login,
  String? avatarUrl,

}) => FollowersModel(  login: login ?? _login,
  avatarUrl: avatarUrl ?? _avatarUrl,
);
  String? get login => _login;
  String? get avatarUrl => _avatarUrl;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    map['avatar_url'] = _avatarUrl;

    return map;
  }

}**/



class User {
  final String username;
  final String avatar_url;
  final String html_url;

  User(this.username, this.avatar_url, this.html_url);

  Map toJson() => {
    'login': username,
    'avatar_url': avatar_url,
    'html_url': html_url
  };

  User.fromJson(Map json) :
        username = json['username'],
        avatar_url = json['avatar_url'],
        html_url = json['html_url'];
}

