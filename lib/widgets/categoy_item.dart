import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_trip_screen.dart';


class categoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  categoryItem({
    superkey,
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  void idk(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CateogryTripScreen.trips, arguments: {'id': id, 'title': title},
      // MaterialPageRoute(
      // builder: (c) => CateogryTripScreen(
      //       catImageUrl: imageUrl,
      //       catId: id,
      //       catTitle: title,
      //     )
      // )
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => idk(context),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageUrl,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline3,
            ),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15)),
          )
        ],
      ),
    );
  }
}
