import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uicode/profile_1/provider.dart';
import 'package:uicode/profile_1/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileOne extends StatefulWidget {
  const ProfileOne({Key key}) : super(key: key);

  @override
  _ProfileOneState createState() => _ProfileOneState();
}

class _ProfileOneState extends State<ProfileOne> {
  Profile profile = ProfileProvider.getProfile();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset(
          'assets/profile/okkk.jpg',
          fit: BoxFit.cover,
          height: size.height * 0.50,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'profile',
              style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.4,
                  fontSize: 30),
            ),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.alignLeft,
                  size: 40,
                  color: Colors.grey[900],
                ),
                onPressed: () {},
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.cog,
                      color: Colors.grey[900],
                      size: 40,
                    ),
                    onPressed: () {}),
              )
            ],
          ),
          body: Stack(
            children: [
              CustomPaint(
                painter: ProfilePainter(),
                child: Container(),
              ),
              Positioned(
                left: size.width * 0.05,
                top: size.height * 0.25,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: ExactAssetImage('assets/shared/ali.jpg'),
                ),
              ),
              Positioned(
                  top: size.height / 2.7,
                  left: 24,
                  bottom: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.user.name,
                          style:
                              TextStyle(fontSize: 40, color: Colors.grey[900]),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey[900],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(profile.user.address)
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("ABOUT ME"),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            padding: EdgeInsets.only(right: 15),
                            width: size.width,
                            child: Text(
                              profile.user.about,
                              style: TextStyle(
                                  fontSize: 19,
                                  height: 1.5,
                                  color: Colors.grey[700],
                                  letterSpacing: 1.1),
                            )),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 5,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ColumnFollow(
                        title: "FOLLOWERS",
                        profile: profile.followers.toString(),
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
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class ColumnFollow extends StatelessWidget {
  const ColumnFollow({
    Key key,
    @required this.title,
    @required this.profile,
  }) : super(key: key);

  final String title, profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          profile,
          style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = Colors.white;
    path.lineTo(0, size.width * 35);
    path.lineTo(size.height, size.width);
    path.lineTo(size.width * 10, size.height * 1);
    path.lineTo(0, size.height * 0.32);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
