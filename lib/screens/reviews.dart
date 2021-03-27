import 'package:bizzhome/models/Review.dart';
import 'package:bizzhome/screens/item_details.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    final reviews = Review.fetchAll();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Reviews (${reviews.length})',
          ),
          backgroundColor: Colors.black,
          brightness: Brightness.light,
        ),
        body: ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (context, index) =>
              _itemBuilder(context, reviews[index]),
        ));
  }
}

Widget _itemBuilder(BuildContext context, review) {
  LinearGradient _gradient =
      LinearGradient(colors: [Color(0xFF84fab0), Color(0xFF8fd3f4)]);
  Color _color = Colors.black;

  if (review.rating >= 5) {
    _gradient = LinearGradient(colors: [Color(0xFF84fab0), Color(0xFF8fd3f4)]);
    _color = Colors.black;
  } else {
    _gradient = LinearGradient(colors: [Color(0xFFDA4453), Color(0xFF89216B)]);
    _color = Colors.white;
  }

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Stack(
        children: <Widget>[
          /// Item card
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox.fromSize(
                size: Size.fromHeight(172.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    /// Item description inside a material
                    Container(
                      margin: EdgeInsets.only(top: 24.0),
                      child: Material(
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(12.0),
                        shadowColor: Color(0x802196F3),
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(gradient: _gradient),
                          child: InkWell(
                            // onTap: () => Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //         builder: (_) => ItemReviewsPage())),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  /// Title and rating
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(review.task,
                                          style: TextStyle(color: _color)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(review.rating.toString(),
                                              style: TextStyle(
                                                  color: _color,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 34.0)),
                                          Icon(Icons.star,
                                              color: _color, size: 24.0),
                                        ],
                                      ),
                                    ],
                                  ),

                                  /// Infos
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Category:',
                                          style: TextStyle(color: _color)),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text(review.category,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: _color)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(54.0),
                          child: Material(
                            elevation: 20.0,
                            shadowColor: Color(0x802196F3),
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              child: ClipOval(
                                child: Image.asset(
                                  review.userImage,
                                ),
                              ),
                              maxRadius: 50,
                            ),
                            // Image.asset(review.userImage),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 170.0, left: 32.0),
            child: Material(
              elevation: 12.0,
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(review.user[0],
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  title: Text(review.user, style: TextStyle()),
                  subtitle: Text(review.comment,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle()),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
