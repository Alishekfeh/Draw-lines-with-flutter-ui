import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uicode/profile5/provider.dart';

class Profile5 extends StatefulWidget {
  const Profile5({Key key}) : super(key: key);

  @override
  _Profile5State createState() => _Profile5State();
}

class _Profile5State extends State<Profile5>
    with SingleTickerProviderStateMixin {
  static Color _textColor = Color(0xFF4e4e4e);
  Profile _profile = ProfileProvider.profile();

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: _textColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: _textColor,
            ),
          ),
        ],
      ),
      body: contentBody(context),
    );
  }

  contentBody(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_profileContent(context), tabBar(context)],
      ),
    );
  }

  _profileContent(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 125,
            width: 125,
            margin: EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("assets/shared/alish.jpg"),
                    fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          Text(
            _profile.user.name,
            style: TextStyle(
                color: _textColor, fontSize: 24, fontWeight: FontWeight.w900),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 1),
            child: Text(
              _profile.user.profession,
              style: TextStyle(color: Colors.grey.shade400),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: Colors.orange[800],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'follow',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
          ),
        ],
      ),
    );
  }

  tabBar(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(color: Colors.grey.shade200),
              bottom: BorderSide(color: Colors.grey.shade200),
            )),
            child: TabBar(
              unselectedLabelColor: Colors.grey.shade400,
              labelColor: _textColor,
              indicatorColor: _textColor,
              controller: _tabController,
              indicatorWeight: 4,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 32),
              tabs: [
                Tab(
                  text: 'PHOTOS',
                ),
                Tab(
                  text: 'VIDEOS',
                ),
                Tab(
                  text: 'POSTS',
                ),
                Tab(
                  text: 'FRIENDS',
                ),
              ],
            ),
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: [
                _photo(context),
                _video(context),
                _posts(context),
                _friends(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  _photo(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(24),
        child: GridView.count(crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: ProfileProvider.photo().map((photo) =>  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(photo),fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        )).toList()
        ),
      ),
    );
  }
  _video(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(24),
        child: GridView.count(crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: ProfileProvider.video().map((video) =>  Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(video),fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            )).toList()
        ),
      ),
    );
  }
  _posts(BuildContext context) {return Flexible(
    child: Container(
      padding: EdgeInsets.all(24),
      child: GridView.count(crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: ProfileProvider.posts().map((posts) =>  Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(posts),fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          )).toList()
      ),
    ),
  );}
  _friends(BuildContext context) {return Flexible(
    child: Container(
      padding: EdgeInsets.all(24),
      child: GridView.count(crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: ProfileProvider.friends().map((friends) =>  Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(friends),fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          )).toList()
      ),
    ),
  );}
}
