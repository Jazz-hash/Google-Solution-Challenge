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
        task: "Delivery to Warehouse",
        category: "Driving",
        rating: 5,
        user: "Jazz",
        userImage: "assets/images/user.jpg",
        comment:
            "Really impressed with his professional behaviour and punctuality!",
      ),
      Review(
        id: 1,
        task: "Catering for Lunch",
        category: "Cooking",
        rating: 4.5,
        user: "Jazz",
        userImage: "assets/images/user.jpg",
        comment: "The food was cold upon delivery.",
      ),
    ];
  }

  static int getCount() {
    final reviews = Review.fetchAll();
    return reviews.length;
  }
}
