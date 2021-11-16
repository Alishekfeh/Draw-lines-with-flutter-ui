import 'package:flutter/material.dart';
import 'package:uicode/profile4/profile4.dart';
import 'package:uicode/profile4/provider4.dart';
import 'package:uicode/widgit/row_follow.dart';

class Profile4 extends StatefulWidget {
  const Profile4({Key key}) : super(key: key);

  @override
  _Profile4State createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  Profile profile = ProfileProvider.getProfile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/profile/girl.jpg",
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
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: bodyCard(context),
          ),
        )
      ],
    );
  }

  bodyCard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.42,
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileRow(context),
          ..._profileText(context),
          SizedBox(height: 10,),
          _divider(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColumnFollow(
                title: "FOLLOWERS",
                profile: profile.follower.toString(),
              ),
              ColumnFollow(
                title: "FOLLOWING",
                profile: profile.following.toString(),
              ),
              ColumnFollow(
                title: "FRIENDS",
                profile: profile.friends.toString(),
              ),
            ],
          ),
          _divider(context),
        ],
      ),
    );
  }

  _profileRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 85,
              width: 85,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/shared/profile.jpg"),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle),
            ),
          ),
          Spacer(flex: 2,),
          RaisedButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black26, width: 1),

                borderRadius: BorderRadius.all(Radius.circular(20))),
            color: Colors.white,
            disabledColor: Colors.transparent,

            child: Text("Add Friend"),
          ),
          SizedBox(width: 16,),
          Container(
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: Colors.grey[800],
              disabledColor: Colors.transparent,

              child: Text("Follow",style: TextStyle(
                color: Colors.white
              ),),
            ),
          ),
        ],
      ),
    );
  }

 List<Widget> _profileText(BuildContext context) {
    return[
      Padding(
        padding: const EdgeInsets.only(left: 24,bottom: 8),
        child: Text(profile.user.name,style: TextStyle(
          color: Colors.grey[900],
          fontWeight: FontWeight.w900,
          fontSize: 26
        ),),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 24,),
        child: Text(profile.user.profession,style: TextStyle(
          color: Colors.grey[500],
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
        child: Text(profile.user.about,style: TextStyle(
          color: Colors.grey[900],
          letterSpacing: 1.1,
          fontSize: 18
        ),),
      ),
    ];
 }
  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade300,
    );
  }
}
