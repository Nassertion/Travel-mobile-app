// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/screens/trip_detail_screen.dart';

import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;
  // final Function removeItem;

  const TripItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.season,
      required this.tripType,
      // required this.removeItem
      });

    


  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      DetailTripScreen.detail,
      arguments: id,
    )
        .then((result) {
      if (result != null) {}
        // removeItem(result);
    });
  }

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return "الشتاء";

      case Season.Spring:
        return "الربيع";

      case Season.Summer:
        return "الصيف";

      case Season.Autumn:
        return "الخريف";
      default:
        return "غير معروف";
    }
  }

  String get triptypeText {
    switch (tripType) {
      case TripType.Exploration:
        return "استكشاف";

      case TripType.Activities:
        return "أنشطة";

      case TripType.Recovery:
        return "نقاهة";

      case TripType.Therapy:
        return "معالجة";
      default:
        return "غير معروف";
    }
  }

  @override

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 250,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.8)
                  ],
                      stops: [
                    0.7,
                    1
                  ])),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline3,
                overflow: TextOverflow.fade,
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.today, color: Colors.orangeAccent),
                    SizedBox(
                      width: 6,
                    ),
                    Text(" $duration ايام ")
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.orangeAccent),
                    SizedBox(
                      width: 6,
                    ),
                    Text(seasonText)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.family_restroom, color: Colors.orangeAccent),
                    SizedBox(
                      width: 6,
                    ),
                    Text(triptypeText)
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
