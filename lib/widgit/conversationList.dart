import 'package:flutter/material.dart';
import 'package:uicode/chat/model_conversion.dart';
import 'package:uicode/chat/provider.dart';

class ConversationList extends StatefulWidget {
  const ConversationList({Key key}) : super(key: key);

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  static List<List<Conversion>>conversion=[
  MessageProvider.getConversion(),
  MessageProvider.getConversion(),
  MessageProvider.getConversion(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
    child: ListView.builder(
        itemCount: conversion.length,
        itemBuilder: (BuildContext context,int position){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(bottom: 16),
                child: Text(conversion[position].first.message.last.dateTime,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade500
                ),),
              ),
              ... List.generate(conversion[position].length, (index) => Container(
                child:
                Card(
                  margin: EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage(conversion[position][index].user[0].avatar),fit: BoxFit.cover
                              ),
                              shape: BoxShape.circle
                          ),

                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(conversion[position][index].user[0].name,style:TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.black87
                            )),
                            SizedBox(height: 5,),
                            Text(  conversion[position][index].message.last.body,style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.1,
                              color: Colors.grey.shade800

                            ),),

                          ],
                        ),
                        Transform.translate(
                            offset: Offset(0,-10),
                            child: Text(conversion[position][index].message.last.dateTime,style: TextStyle(
                              color: Colors.pink.shade600
                            ),))
                      ],
                    ),
                  ),
                ),
              )),
            ],
          );
        }),
    );
  }
}
