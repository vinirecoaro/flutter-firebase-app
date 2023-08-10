import 'package:flutter/material.dart';

import '../../models/text_model.dart';

class ChatWidget extends StatelessWidget {
  final TextModel textModel;
  final bool itsMe;
  const ChatWidget({super.key, required this.textModel, required this.itsMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: itsMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: itsMe ? Colors.blue : Colors.orange),
        child: Column(
          children: [
            Text(
              textModel.nickname,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              textModel.text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
