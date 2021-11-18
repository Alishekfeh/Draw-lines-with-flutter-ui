
import 'package:uicode/chat/chat_list.dart';

class Message{
  User sender,receiver;
  String dateTime,body;
  Message({this.sender,this.dateTime,this.receiver,this.body});
}