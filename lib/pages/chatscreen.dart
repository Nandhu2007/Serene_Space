import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class Chat {
  String text;
  bool amsender;

  Chat(this.text, this.amsender);
}

class _ChatScreenState extends State<ChatScreen> {
  late OpenAI openAI;
  final TextEditingController _controller = TextEditingController();

  final List<Chat> _conversations = [];

  @override
  void initState() {
    openAI = OpenAI.instance
        .build(token: "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");
    super.initState();
  }

  void send() async {
    var text = _controller.text;
    if (text.trim().isEmpty) {
      return;
    }

    setState(() {
      _conversations.add(Chat(text, true));
    });
    var resp = await openAI.onCompletion(
        request: CompleteText(prompt: text, model: TextBabbage001Model()));

    if (resp!.choices.isNotEmpty) {
      setState(() {
        _conversations.add(Chat(resp.choices.last.text, false));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            var convo = _conversations[index];
            return Chip(label: Text(convo.text));
          },
          itemCount: _conversations.length,
        )),
        SafeArea(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: "Type Here..."),
                  )),
                  IconButton(onPressed: send, icon: Icon(Icons.send))
                ],
              )),
        )
      ]),
    );
  }
}
