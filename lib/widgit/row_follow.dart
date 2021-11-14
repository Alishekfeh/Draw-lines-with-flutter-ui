import 'package:flutter/material.dart';
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