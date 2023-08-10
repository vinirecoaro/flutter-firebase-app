import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/pages/chat/chat_page.dart';
import 'package:flutterfirebaseapp/pages/task_page.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    var nicknameController = TextEditingController();

    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text("Tarefas"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const TaskPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text("Chat"),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: Wrap(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(remoteConfig.getString("TEXT_CHAT")),
                              TextField(
                                controller: nicknameController,
                              ),
                              TextButton(
                                  onPressed: () {
                                    nicknameController.text = "";
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ChatPage(
                                                nickname:
                                                    nicknameController.text)));
                                  },
                                  child: const Text("Entrar no chat"))
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text("Crashlytics"),
            onTap: () {
              throw Exception();
            },
          ),
        ],
      ),
    );
  }
}
