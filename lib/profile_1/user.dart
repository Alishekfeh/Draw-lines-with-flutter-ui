class User{
  String name,address,about;
  User({this.about,this.address,this.name});
}
class Profile{
  User user;
  int followers,following,friends;
  Profile({this.user,this.followers,this.following,this.friends});
}