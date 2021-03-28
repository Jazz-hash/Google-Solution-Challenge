class Review {
  final int id;
  // final Task task;
  final String task;
  final String category;
  final double rating;
  // final User user;
  final String user;
  final String userImage;
  final String comment;

  Review(
      {this.id,
      this.task,
      this.category,
      this.rating,
      this.user,
      this.userImage,
      this.comment});

  static List<Review> fetchAll() {
    return [
      Review(
        id: 1,
        task: "Task 1",
        category: "Baking",
        rating: 6.4,
        user: "Jazz",
        userImage: "assets/images/user.jpg",
        comment: "waah janii waah !!",
      ),
      Review(
        id: 1,
        task: "Task 2",
        category: "Cooking",
        rating: 2.3,
        user: "Jazz",
        userImage: "assets/images/user.jpg",
        comment: "beekar !!",
      ),
    ];
  }

  static int getCount() {
    final reviews = Review.fetchAll();
    return reviews.length;
  }
}
