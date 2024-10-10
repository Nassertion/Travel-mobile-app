import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/categories_screen.dart';
import 'package:travel_app/screens/favorite_screen.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoritetrips);
  final List<Trip> favoritetrips;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void selectScreen(int index) {
    setState(() {
      selectedscreenIndex = index;
    });
  }

  int selectedscreenIndex = 0;
  late List<Map<String, dynamic>> screens;

  @override
  void initState() {
    screens = [
      {'screen': Categoriescreen(), 'title': "دليل سياحي"},
      {'screen': favoriteScreen(widget.favoritetrips), 'title': "المفضلة"}
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          screens[selectedscreenIndex]['title'].toString(),
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: screens[selectedscreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectScreen,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: selectedscreenIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'التصنيفات'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضلة'),
        ],
      ),
    );
  }
}


















// import 'package:flutter/material.dart';
// import 'package:travel_app/screens/categories_screen.dart';

// import 'package:travel_app/screens/favorite_screen.dart';

// class TabsScreen extends StatelessWidget {
//   const TabsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             " دليل سياحي",
//             style: Theme.of(context).textTheme.headline3,
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.blue,
//           bottom: TabBar(
//               labelColor: Colors.yellow,
//               indicatorColor: Colors.yellow,
//               unselectedLabelColor: Colors.white,
//               dividerColor: Colors.yellow,
//               tabs: [
//                 Tab(
//                   icon: Icon(
//                     Icons.dashboard,
//                     color: Colors.white,
//                   ),
//                   text: "التصنيفات",
//                 ),
//                 Tab(
//                   icon: Icon(
//                     Icons.star,
//                     color: Colors.white,
//                   ),
//                   text: "المفضلة",
//                 ),
//               ]),
//         ),
//         body: TabBarView(children: [Categoriescreen(), favoriteScreen()]),
//       ),
//     );
//   }
// }



















