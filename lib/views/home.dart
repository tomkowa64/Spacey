import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacey/components/storage_card.dart';
import 'package:spacey/inc/navigation_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StorageCard("Magazyn 1", "Kolbuszowa",
                      "Najnowszy magazyn na Podkarpaciu", 2500, 3000),
                  StorageCard(
                      "Magazyn 2", "Sędziszów", "Dom Karola", 1700, 4000),
                  StorageCard("Magazyn 3", "Rzeszów",
                      "Najnowszy magazyn w Rzeszowie", 200, 2000)
                ],
              ),
            ],
          )),
    );
  }
}
