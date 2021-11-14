import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uicode/profile_1/user.dart';
import 'package:uicode/profile_2/provider_tow.dart';
import 'package:uicode/widgit/row_follow.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key key}) : super(key: key);

  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  Profile _profile = ProfileProvider.getProfile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/profile/new.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height/2.5,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.bars),
            ),
          ),
          body: Stack(
            children: [
              _profileTitle(context),
              _profileBody(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _profileTitle(BuildContext context) {
    return Positioned(
        top: 1,
        right: 0,
        left: 0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        shape: BoxShape.circle),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(1),
                        shape: BoxShape.circle),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage: ExactAssetImage('assets/shared/profile.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              _profile.user.name,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  color: Colors.white,
                  letterSpacing: 1.4),
            ),
            Text(
              _profile.user.address,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 1.1),
            ),
          ],
        ));
  }

  Widget _profileBody(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.224,
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _counters(context),
              _divider(context),
              ..._aboutMe(context),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "FRIENDS(${_profile.friends.toString()})",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                      fontSize: 20,
                      color: Colors.black87),
                ),
              ),
              contacts(context)
            ],
          ),
        ));
  }

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColumnFollow(
            title: "FOLLOWERS",
            profile: _profile.followers.toString(),
          ),
          ColumnFollow(
            title: "FOLLOWING",
            profile: _profile.following.toString(),
          ),
          ColumnFollow(
            title: "FRIENDS",
            profile: _profile.friends.toString(),
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade300,
    );
  }

  List<Widget> _aboutMe(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "About Me",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
              fontSize: 20,
              color: Colors.black87),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          _profile.user.about,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              fontSize: 18,
              color: Colors.grey.shade800,
              height: 1.3),
        ),
      )
    ];
  }

  Widget contacts(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.all(20),
        // itemExtent: 90,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(
            25,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                    child: CircleAvatar(
                      radius: 40,

                      backgroundImage: ExactAssetImage('assets/shared/profile.jpg',scale: 40),


                    ),
                  ),
            )).toList(),
      ),
    );
  }
}
