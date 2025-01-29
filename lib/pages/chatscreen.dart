// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hcpa/pages/widgets/messageTile.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List messageList = [
    ["Olá, como posso ajudar?", false]
  ];
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
                child: Text(
              "Chat",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                reverse: true,
                itemCount: messageList.length,
                itemBuilder: (context, index) => MessageTile(
                  message: messageList[index][0],
                  sender: messageList[index][1],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Mensagem',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                  ),
                  autofocus: true,
                  onSubmitted: (value) {
                    setState(() {
                      messageList.insert(0, [value, true]);
                      _controller.clear();
                    });
                  }),
            )
          ],
        ));
  }
}
