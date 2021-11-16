class User{
  String name,profession,about;
  User({this.name,this.about,this.profession});
}
class Profile{
  User user;
  int following,follower,friends;
  Profile({this.user,this.friends,this.follower,this.following});
}