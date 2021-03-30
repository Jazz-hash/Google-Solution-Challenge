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

  static List<Task> fetchMyTasks() {
    return [
      Task(
        id: 1,
        title: "Delivery to Warehouse",
        description:
            " The driver will be required to deliver a package to the Warehouse and hand it over to M.Khan.",
        status: "Completed",
        client: Client(
          name: "Hamza Rauf",
          company: "Oaks",
          profileUrl: " ",
        ),
        assignedDate: "1/2/2021",
        duration: "1 hour",
        points: "10",
        pointsEarned: "0",
        imagePath: "assets/images/background.jpg",
      ),
      Task(
        id: 2,
        title: "Catering for Lunch",
        description:
            "There is an upcoming annual lunch for which the company needs a talented home cook to cook food for 60 people. Menu would include Salad, Biryani, and Kheer",
        status: "Completed",
        client: Client(
          name: "Hana Rana",
          company: "Cloud Nine",
          profileUrl: " ",
        ),
        assignedDate: "3/4/2021",
        duration: "2 weeks",
        points: "100",
        pointsEarned: "100",
        imagePath: "assets/images/background.jpg",
      ),
    ];
  }

  static List<Task> fetchAll() {
    return [
      Task(
        id: 1,
        title: "Delivery to Warehouse",
        description:
            " The driver will be required to deliver a package to the Warehouse and hand it over to M.Khan.",
        status: "Completed",
        client: Client(
          name: "Hamza Rauf",
          company: "Oaks",
          profileUrl: " ",
        ),
        assignedDate: "1/2/2021",
        duration: "1 hour",
        points: "10",
        pointsEarned: "0",
        imagePath: "assets/images/background.jpg",
      ),
      Task(
        id: 2,
        title: "Catering for Lunch",
        description:
            "There is an upcoming annual lunch for which the company needs a talented home cook to cook food for 60 people. Menu would include Salad, Biryani, and Kheer",
        status: "Completed",
        client: Client(
          name: "Hana Rana",
          company: "Cloud Nine",
          profileUrl: " ",
        ),
        assignedDate: "3/4/2021",
        duration: "2 weeks",
        points: "100",
        pointsEarned: "100",
        imagePath: "assets/images/background.jpg",
      ),
      Task(
        id: 3,
        title: "Van Service for Employees",
        description:
            "We need a van service provider who can pick and drop the employees safely to workplace. We want our workers to avoid everyday hassle and enjoy the smooth and safe ride",
        status: "Available",
        client: Client(
          name: "Abdullah Khan",
          company: "City Bank",
          profileUrl: "",
        ),
        assignedDate: "date",
        duration: "1 year",
        points: "300",
        pointsEarned: "100",
        imagePath: "assets/images/background.jpg",
      ),
    ];
  }

  static Task fetchMyTaskByID(int taskID) {
    // NOTE: this will replaced by a proper API call
    List<Task> tasks = Task.fetchMyTasks();
    for (var i = 0; i < tasks.length; i++) {
      if (tasks[i].id == taskID) {
        return tasks[i];
      }
    }
    return null;
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

  static List<Task> fetchCompanyTasks(String company) {
    List<Task> tasks = Task.fetchAll();
    List<Task> companyTasks = [];
    for (var i = 0; i < tasks.length; i++) {
      if (tasks[i].client.company == company) {
        companyTasks.add(tasks[i]);
      }
    }
    return companyTasks;
  }
}
