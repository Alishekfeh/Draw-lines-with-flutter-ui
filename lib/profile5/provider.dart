
class User{
  String name,profession;

  User({this.profession,this.name});
}
class Profile{
  User user;
  Profile({this.user});
}
class ProfileProvider{
 static Profile profile(){
   return Profile(
     user: User(
       name: 'Erik walter',
       profession: 'photography'
     )
   );
 }
  static List<String>photo(){
    return List.generate(15,(index){
      return "assets/shared/profile.jpg";
    });
  }
  static List<String>video(){
    return List.generate(15,(index){
      return "assets/shared/profile.jpg";
    });
  }
  static List<String>posts(){
    return List.generate(15,(index){
      return "assets/shared/profile.jpg";
    });
  }
  static List<String>friends(){
    return List.generate(15,(index){
      return "assets/shared/profile.jpg";
    });
  }
}