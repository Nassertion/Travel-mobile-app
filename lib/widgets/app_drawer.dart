import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  ListTile BuildListTile(
      BuildContext context, String title, IconData myicon, String routename) {
    return ListTile(
      leading: Icon(
        myicon,
        size: 32,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routename);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.amber,
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Text(
              "دليلك السياحي",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BuildListTile(context, "الرحلات", Icons.card_travel, '/'),
          BuildListTile(
              context, "المفلترة", Icons.filter_list, filterScreen.filter),

          // ListTile(            leading: Icon(
          //     Icons.star_border,
          //     size: 32,
          //     color: Colors.blue,
          //   ),
          //   title: Text(
          //     'المفلترة',
          //     style: Theme.of(context).textTheme.headline4,
          //   ),
          //   onTap: (){
          //     ////
          //   },
          // )
        ],
      ),
    );
  }
}
