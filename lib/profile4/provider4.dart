
import 'package:uicode/profile4/profile4.dart';

class ProfileProvider{
  static Profile getProfile(){
    return Profile(
      user: User(
        name: 'Erik walter',
        profession: 'photography',
        about: "composition of rich instruments and vocals. Together, artists Vieux Farka Touré, Oumy Gueye, Amadou & Mariam, Tal National"
      ),
      follower: 333,
      friends: 25,
      following: 444
    );
  }
}