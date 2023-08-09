import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/pages/chat/chat_page.dart';
import 'package:flutterfirebaseapp/shared/widgets/custon_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var nicknameController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      drawer: const CustonDrawer(),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Informe seu apelido"),
            TextField(
              controller: nicknameController,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              ChatPage(nickname: nicknameController.text)));
                },
                child: const Text("Entrar no chat"))
          ],
        ),
      ),
    ));
  }
}
