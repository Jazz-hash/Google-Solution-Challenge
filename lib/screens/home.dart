import 'package:bizzhome/models/Category.dart';
import 'package:bizzhome/widgets/categoryCard.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final categories = Category.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // constraints: BoxConstraints.expand(),
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) =>
                _itemBuilder(context, categories[index]),
          ),
        )
      ],
    );
  }

  Widget _itemBuilder(BuildContext context, category) {
    return Container(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 245.0,
          child: Stack(
            children: [
              CategoryCard(category.title),
            ],
          ),
        ),
      ),
    );
  }
}
