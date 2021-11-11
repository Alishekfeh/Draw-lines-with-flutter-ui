import 'package:uicode/profile_1/user.dart';

class ProfileProvider {
  static Profile getProfile() {
    return Profile(
        user: User(
            name: 'Ali',
            address: 'amman/tarek',
            about:
                'Text quotations selected from books and archive transcripts '
                'at the Krishnamurti Foundation. The Foundation makes available '
                'Krishnamurti’s teachings since its inception in 1969. Founded by J '),
        followers: 120,
        following: 180,
        friends: 20);
  }
}
