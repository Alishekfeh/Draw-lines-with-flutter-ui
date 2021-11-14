class User{
String name,address,about;
User({this.name,this.about,this.address});
}
class Profile{
  User user;
  int following,follower,friends;
  Profile({this.user,this.friends,this.following,this.follower});
}