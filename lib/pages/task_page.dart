// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/model/task_model.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var descriptionController = TextEditingController();
  final db = FirebaseFirestore.instance;
  var justNotConcluded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Tarefas")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            descriptionController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar Tarefa"),
                    content: TextField(
                      controller: descriptionController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            var task = TaskModel(
                                description: descriptionController.text,
                                concluded: false);
                            await db.collection("tasks").add(task.toJson());
                            Navigator.pop(context);
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Apenas não concluidos",
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                        value: justNotConcluded,
                        onChanged: (bool value) {
                          justNotConcluded = value;
                          setState(() {});
                        })
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: justNotConcluded
                        ? db
                            .collection("tasks")
                            .where("concluded", isEqualTo: false)
                            .snapshots()
                        : db.collection("tasks").snapshots(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? const CircularProgressIndicator()
                          : ListView(
                              children: snapshot.data!.docs.map((e) {
                                var task = TaskModel.fromJson(
                                    e.data() as Map<String, dynamic>);
                                return Dismissible(
                                  onDismissed: (DismissDirection
                                      dismissDirection) async {
                                    await db
                                        .collection("tasks")
                                        .doc(e.id)
                                        .delete();
                                  },
                                  key: Key(e.id),
                                  child: ListTile(
                                    title: Text(task.description),
                                    trailing: Switch(
                                      onChanged: (bool value) async {
                                        task.concluded = value;
                                        await db
                                            .collection("tasks")
                                            .doc(e.id)
                                            .update(task.toJson());
                                      },
                                      value: task.concluded,
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
