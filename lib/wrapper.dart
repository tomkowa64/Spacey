import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacey/services/auth.dart';
import 'package:spacey/views/start.dart';
import 'models/appUser.dart';
import 'views/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    // TO DELETE
    final AuthService _auth = AuthService();
    _auth.signOut();

    if(user == null) {
      return const Start();
    }
    else {
      return const Home();
    }
  }
}
