import 'package:uicode/profile3/profile3.dart';

class ProfileProvider {
  static Profile getProfile() {
    return Profile(
        user: User(
            name: "Erik Walters ",
            address: "355 tarek amman",
            about:
                "Our Magazine is written by young people from the UK. Each year we select a new group of bloggers, from the British Council’s language assistants, who share their experiences of learning languages and living abroad. The views and opinions expressed in the articles are those of the authors and do not necessarily reflect the views or opinions of the LearnEnglish Teens team."),
        following: 124,
        friends: 145,
        follower: 55,
        photo: 25
    );
  }
}
