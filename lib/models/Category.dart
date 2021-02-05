class Category {
  final int id;
  final String title;

  Category({this.id, this.title});

  static List<Category> fetchAll() {
    return [
      Category(
        id: 1,
        title: "Category 1",
      ),
      Category(
        id: 1,
        title: "Category 2",
      ),
      Category(
        id: 1,
        title: "Category 3",
      ),
      Category(
        id: 1,
        title: "Category 4",
      ),
      Category(
        id: 1,
        title: "Category 5",
      ),
    ];
  }
}
