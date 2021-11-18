import 'package:flutter/material.dart';
import 'package:uicode/chat/model_conversion.dart';
import 'package:uicode/chat/provider.dart';
import 'package:uicode/widgit/conversationList.dart';
import 'package:uicode/widgit/paint_back_ground.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList>with SingleTickerProviderStateMixin {
  List<Conversion> _conversion = MessageProvider.getConversion();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        CustomPaint(
          painter: ChatBackground(),
          child: Container(),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "MESSAGES",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              onPressed: (){},
              icon: Icon(Icons.chevron_left,size: 44,),
            ),
            bottom: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.black45,
              indicatorColor: Colors.transparent,
              indicator: BoxDecoration(),
              tabs: [
                Tab(text: "inBox",),
                Tab(text: "Groups",),
                Tab(text: "online(22)",),
                Tab(text: "history",),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              ConversationList(),
              Container(),
              Container(),
              Container(),
            ],
          ),
        )
      ],
    );
  }
}
