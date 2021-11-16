class User{
  String name,address,about;
  User({this.about,this.address,this.name});
}

class Profile{
  User user;
  int following,follower,friends,photo;

  Profile({this.user,this.friends,this.follower,this.following,this.photo});
}