import 'package:uicode/profile_1/user.dart';

class ProfileProvider {
  static Profile getProfile() {
    return Profile(
        user: User(
            name: 'Erik Walter',
            address: "776 Adams",
            about:
                "Asked another way, do you make any effort to moderate the quality of your thoughts? Change your thinking and you will change your life! I learned in a 12 step program 40 years ago a saying, “Be careful of stinking thinking” and I might add our words, for our word is our wand."),
        friends: 111,
        following: 122,
        followers: 1111);
  }
}
