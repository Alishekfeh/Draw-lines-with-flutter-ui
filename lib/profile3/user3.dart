import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uicode/profile3/profile3.dart';
import 'package:uicode/profile3/provider3.dart';
import 'package:uicode/widgit/row_follow.dart';

class Profile3 extends StatefulWidget {
  const Profile3({Key key}) : super(key: key);

  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  Profile _profile = ProfileProvider.getProfile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/profile/bach.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                _bodyContent(context),
                _profileImage(context),
              ],
            ))
      ],
    );
  }

  _bodyContent(BuildContext context) {
    return Positioned(
        left: 15,
        right: 15,
        bottom: 0,
        top: MediaQuery.of(context).size.height / 10,
        child: Container(
          padding: EdgeInsets.only(top: 75),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: ListView(
            children: [
              Text(_profile.user.name,style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 24),
                child: Text(_profile.user.address,textAlign: TextAlign.center,),
              ),
              _followBottom(context),
              Padding(
                padding:  EdgeInsets.only(top: 16),
                child: _divider(context),
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ColumnFollow(
                      title: "FOLLOWERS",
                      profile: _profile.follower.toString(),
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
               ),
              _divider(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Text("PHOTO(${_profile.photo}) :",style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w400
                ),),
              ),
              _photo(context),
              ... _aboutMe(context)
            ],
          ),
        ));
  }

  _followBottom(BuildContext context) {
    return Align(
      child: MaterialButton(
        onPressed: () {},
        color: Colors.orange[800],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: Text(
            'follow',
            style: TextStyle(color: Colors.white,fontSize: 16),
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
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
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              fontSize: 16,
              color: Colors.grey.shade800,
              height: 1.4),
        ),
      )
    ];
  }
  _photo(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      padding: EdgeInsets.only(left: 24),
      child: ListView(
        children: List.generate(_profile.photo, (index){
          return Container(
            height: 110,
            width: 110,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/profile/okkk.jpg'),fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            
          );
        }
        ).toList(),
        scrollDirection: Axis.horizontal,
      ),
    );

  }
}

_profileImage(BuildContext context) {
  return Positioned(
      top: MediaQuery.of(context).size.height / 10 - 50,
      left: MediaQuery.of(context).size.width / 2 - 50,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/shared/profile.jpg'),
                fit: BoxFit.cover),
            shape: BoxShape.circle),
      ));
}
Widget _divider(BuildContext context) {
  return Container(
    height: 1,
    color: Colors.grey.shade300,
  );
}
