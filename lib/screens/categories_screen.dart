import "package:flutter/material.dart";
import "package:travel_app/widgets/categoy_item.dart";
import "../app_data.dart";

class Categoriescreen extends StatelessWidget {
  const Categoriescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      //استخدام الماب
      children: data
          .map((categorydata) => categoryItem(
              id: categorydata.id,
              title: categorydata.title,
              imageUrl: categorydata.imageUrl))
          .toList(),
    );
  }
}
