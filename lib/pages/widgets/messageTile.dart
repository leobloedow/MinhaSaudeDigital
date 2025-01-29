// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final bool sender;

  MessageTile({super.key, required this.message, required this.sender});

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  EdgeInsets MessageSide(bool side) {
    if (side) {
      return EdgeInsets.fromLTRB(200, 3, 2.5, 3);
    } else {
      return EdgeInsets.fromLTRB(2.5, 3, 200, 3);
    }
  }

  Color? MessageColor(bool side) {
    if (side) {
      return Colors.blue[100];
    } else {
      return Colors.purple[100];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MessageSide(widget.sender),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: MessageColor(widget.sender),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          widget.message,
          style: TextStyle(fontFamily: "poppins", fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
