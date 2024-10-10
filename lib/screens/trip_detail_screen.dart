import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';

class DetailTripScreen extends StatelessWidget {
  static const detail = '/trip_detail_screen';
  final Function managefavorites;
  final Function isfavorite;
  DetailTripScreen(this.managefavorites, this.isfavorite);
  Widget buildSectionTitle(
    BuildContext context,
    String titleText,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      alignment: Alignment.centerRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget buildContainer(double heightOf, Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: heightOf,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedTrip.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedTrip.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, "الانشطة"),
              buildContainer(
                  220,
                  ListView.builder(
                    itemCount: selectedTrip.activities.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      child: Card(
                        shape: BorderDirectional(
                            bottom: BorderSide(
                          style: BorderStyle.solid,
                          width: 0.1,
                        )),
                        elevation: 0.3,
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: Text(
                            selectedTrip.activities[index],
                          ),
                        ),
                      ),
                    ),
                  )),
              buildSectionTitle(context, "البرنامج اليومي"),
              buildContainer(
                  250,
                  ListView.builder(
                      itemCount: selectedTrip.program.length,
                      itemBuilder: (context, index) => Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  maxRadius: 30,
                                  child: Text(
                                    "اليوم ${index + 1}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                title: Text(selectedTrip.program[index]),
                              ),
                              Divider(
                                thickness: 0.3,
                              )
                            ],
                          ))),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Icon(
            isfavorite(tripId) ? Icons.star : Icons.star_border,
          ),
          onPressed: () => managefavorites(tripId),
        ));
  }
}
