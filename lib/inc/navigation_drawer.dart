import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spacey/views/home.dart';

class NavigationDrawer extends StatelessWidget {
  // const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 30, right: 16, bottom: 16, left: 16),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new Text(
                      "Spacey",
                      style: TextStyle(
                          fontSize: 40,
                          color: const Color(0xff303744),
                          fontStyle: FontStyle.italic,
                          fontFamily: "Lucida Calligraphy Italic"),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()))),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Account',
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () async {
              //Navigator.pushAndRemoveUntil(
              //    context,
              //    MaterialPageRoute(builder: (context) => Splash()),
              //    (Route<dynamic> route) => false);
              //await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
