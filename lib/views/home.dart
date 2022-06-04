import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacey/components/storage_card.dart';
import 'package:spacey/inc/navigation_drawer.dart';
import 'package:spacey/models/magazine.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final magazines = Provider.of<List<Magazine>>(context);

    return Scaffold(
      drawer: NavigationDrawer(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(42, 59, 113, 1),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                magazines.length,
                (index) => StorageCard(
                  magazines[index].name,
                  magazines[index].city,
                  magazines[index].description,
                  magazines[index].occupiedSpace.toInt(),
                  magazines[index].maxSpace.toInt()
                ),
              ),
            ),
          ],
        )),
    );
  }
}
