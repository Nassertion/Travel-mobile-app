import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

class favoriteScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;
  const favoriteScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(
        child: Text("لا يوجد رحلات مفضلة"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            season: favoriteTrips[index].season,
            tripType: favoriteTrips[index].tripType,
            // removeItem: _removetrip,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
