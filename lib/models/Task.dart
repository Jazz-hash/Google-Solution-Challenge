class Task {
  final int id;
  final String title;
  final String description;
  final String date;

  Task({
    this.id,
    this.title,
    this.description,
    this.date,
  });

  static List<Task> fetchAll() {
    return [
      Task(
        id: 1,
        date: "date",
        description: "Description",
        title: "Task 1",
      ),
      Task(
        id: 1,
        date: "date",
        description: "Description",
        title: "Task 2",
      ),
      Task(
        id: 1,
        date: "date",
        description: "Description",
        title: "Task 3",
      ),
      Task(
        id: 1,
        date: "date",
        description: "Description",
        title: "Task 4",
      ),
      Task(
        id: 1,
        date: "date",
        description: "Description",
        title: "Task 5",
      ),
    ];
  }

  // static Location fetchByID(int locationID) {
  //   // NOTE: this will replaced by a proper API call
  //   List<Location> locations = Location.fetchAll();
  //   for (var i = 0; i < locations.length; i++) {
  //     if (locations[i].id == locationID) {
  //       return locations[i];
  //     }
  //   }
  //   return null;
  // }
}
