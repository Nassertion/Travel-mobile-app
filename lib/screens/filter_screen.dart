import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class filterScreen extends StatefulWidget {
  static const filter = '/filter_screen';
  final Function savefilters;
  final Map<String, bool> currentFilter;
  const filterScreen(this.currentFilter, this.savefilters);
  @override
  State<filterScreen> createState() => _filterScreenState();
}

class _filterScreenState extends State<filterScreen> {
  var _forFamily = false;
  var _Summer = false;
  var _Winter = false;

  SwitchListTile buildListTile(String title, String subtitle, var currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
        activeColor: Color.fromARGB(255, 55, 126, 183),
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  initState() {
    _Summer = widget.currentFilter['summer']!;
    _Winter = widget.currentFilter['winter']!;
    _forFamily = widget.currentFilter['family']!;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: IconButton(
                icon: Icon(
                  Icons.save,
                  size: 30,
                ),
                onPressed: () {
                  final selectedFilters = {
                    'summer': _Summer,
                    'winter': _Winter,
                    'family': _forFamily
                  };
                  widget.savefilters(selectedFilters);
                },
              ),
            )
          ],
          iconTheme: IconThemeData(color: Colors.white),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "الفلترة",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true),
      drawer: AppDrawer(),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: ListView(
          children: [
            buildListTile(
                "الرحلات الصيفية فقط", "أظهار الرحلات في فصل الصيف ", _Summer,
                (newValue) {
              setState(() {
                _Summer = newValue;
              });
            }),
            buildListTile(
                "الرحلات الشنوية فقط", "أظهار الرحلات في فصل الشتاء ", _Winter,
                (newValue) {
              setState(() {
                _Winter = newValue;
              });
            }),
            buildListTile(
                "للعائلات", "أظهار الرحلات الت للعائلات  فقط", _forFamily,
                (newValue) {
              setState(() {
                _forFamily = newValue;
              });
            })
          ],
        ))
      ]),
    );
  }
}
