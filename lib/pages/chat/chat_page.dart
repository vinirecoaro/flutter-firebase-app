import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String nickname;
  const ChatPage({super.key, required this.nickname});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    children: [
                      const Expanded(
                          child: TextField(
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none))),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.send))
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    ));
  }
}
