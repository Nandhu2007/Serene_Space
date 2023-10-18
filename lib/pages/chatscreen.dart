import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late OpenAI openAI;

  @override
  void initState() {
    openAI = OpenAI.instance.build(token: "key");
    super.initState();
  }

  void send() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
            child: ListView(
          children: [],
        )),
        SafeArea(
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(hintText: "Type Here..."),
              )),
              IconButton(onPressed: send, icon: Icon(Icons.send))
            ],
          ),
        )
      ]),
    );
  }
}
