import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/pages/task_page.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
          )
        ],
      ),
    );
  }
}
