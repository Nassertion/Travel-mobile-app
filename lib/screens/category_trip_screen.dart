import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';

import '../widgets/trip_item.dart';

class CateogryTripScreen extends StatefulWidget {
  static const trips = '/category_trip_screen';
  final List<Trip> availableTrips;
  CateogryTripScreen(this.availableTrips);
  // CateogryTripScreen({
  //   super.key,
  //   // required this.catId,
  //   // required this.catTitle,
  //   // required this.catImageUrl,
  // });

  @override
  State<CateogryTripScreen> createState() => _CateogryTripScreenState();
}

class _CateogryTripScreenState extends State<CateogryTripScreen> {
  // final String catId;
  late String categoryTitle;
  List<Trip>? displayTrips;

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // ignore: unused_local_variable
    final catId = routeArgs['id'];
    categoryTitle = routeArgs['title']!;

    // غير
    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removetrip(String tripId) {
    setState(() {
      displayTrips?.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text(categoryTitle, style: Theme.of(context).textTheme.headline2),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return TripItem(
              id: displayTrips![index].id,
              title: displayTrips![index].title,
              imageUrl: displayTrips![index].imageUrl,
              duration: displayTrips![index].duration,
              season: displayTrips![index].season,
              tripType: displayTrips![index].tripType,
              // removeItem: _removetrip,
            );
          },
          itemCount: displayTrips?.length,
        ));
  }
}
