class TaskModel {
  String description = "";
  bool concluded = false;

  TaskModel({required this.description, required this.concluded});

  TaskModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    concluded = json['concluded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['concluded'] = this.concluded;
    return data;
  }
}
