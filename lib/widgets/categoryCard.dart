import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;

  CategoryCard(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Center(child: Text(title)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
