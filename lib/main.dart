import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/category_trip_screen.dart';
import 'package:travel_app/screens/filter_screen.dart';
import 'package:travel_app/screens/tabs_screen.dart';
import 'package:travel_app/screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<Trip> _availableTrips = Trips_data;
List<Trip> _favoriteTrips = [];
Map<String, bool> _filters = {
  'summer': false,
  'winter': false,
  'family': false
};

class _MyAppState extends State<MyApp> {
  void _changefilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;
      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _managefavorites(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isfavoirite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("ar", "AE")],
      locale: Locale("ar", "AE"),
      theme: ThemeData(
        fontFamily: "ElMessiri",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 32,
                fontFamily: "PoetsenOne",
              ),
              headline2: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: "ElMessiri",
                  fontWeight: FontWeight.bold),
              headline3: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: "ElMessiri",
                  fontWeight: FontWeight.bold),
              headline4: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "ElMessiri",
                  fontWeight: FontWeight.bold),
            ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'travel app ',
      // home: Categoriescreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteTrips),
        CateogryTripScreen.trips: (ctx) => CateogryTripScreen(_availableTrips),
        DetailTripScreen.detail: (context) =>
            DetailTripScreen(_managefavorites, _isfavoirite),
        filterScreen.filter: (context) => filterScreen(_filters, _changefilters)
      },
    );
  }
}
