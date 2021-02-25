import 'package:bizzhome/models/Client.dart';

class Task {
  final int id;
  final String title;
  final String description;
  final String status;
  final Client client;
  final String assignedDate;
  final String duration;
  final String points;
  final String pointsEarned;
  final String imagePath;

  Task({
    this.id,
    this.title,
    this.description,
    this.status,
    this.client,
    this.assignedDate,
    this.duration,
    this.points,
    this.pointsEarned,
    this.imagePath,
  });

  static List<Task> fetchAll() {
    return [
      Task(
        id: 1,
        title: "Task 1",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        status: "In-Progress",
        client: Client(
          name: "Batman",
          profileUrl: "bizzhome:batman",
        ),
        assignedDate: "date",
        duration: "1 month",
        points: "100",
        pointsEarned: "0",
        imagePath: "assets/images/background.jpg",
      ),
      Task(
        id: 2,
        title: "Task 2",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        status: "Completed",
        client: Client(
          name: "Batman",
          profileUrl: "bizzhome:batman",
        ),
        assignedDate: "date",
        duration: "1 month",
        points: "100",
        pointsEarned: "100",
        imagePath: "assets/images/background.jpg",
      ),
    ];
  }

  static Task fetchByID(int taskID) {
    // NOTE: this will replaced by a proper API call
    List<Task> tasks = Task.fetchAll();
    for (var i = 0; i < tasks.length; i++) {
      if (tasks[i].id == taskID) {
        return tasks[i];
      }
    }
    return null;
  }

  static List<Task> fetchInProgress(String type) {
    List<Task> tasks = Task.fetchAll();
    List<Task> inProgressTask = [];
    for (var i = 0; i < tasks.length; i++) {
      if (tasks[i].status == type) {
        inProgressTask.add(tasks[i]);
      }
    }
    return inProgressTask;
  }
}
