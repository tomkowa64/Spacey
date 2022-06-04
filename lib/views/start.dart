import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacey/services/auth.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: const EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Spacey-login-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            SizedBox(
                                width: 100,
                                height: 150,
                                child: Image(
                                    image: AssetImage(
                                        "assets/images/icons/foil-space-blanket-512.png")))
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            "LOGIN",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 24,
                                letterSpacing: 3,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            "Email",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(194, 194, 194, 0.7)),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: TextFormField(
                              validator: (val) => !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!.trim()) ? 'Enter proper email' : null,
                              onChanged: (val) {
                                setState(() {
                                  email = val.trim();
                                });
                              },
                              style: TextStyle(fontSize: 20, color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            "Hasło",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(194, 194, 194, 0.7)),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: TextFormField(
                              validator: (val) => val!.trim().length < 6 ? 'Enter a valid password' : null,
                              onChanged: (val) {
                                setState(() {
                                  password = val.trim();
                                });
                              },
                              obscureText: true,
                              style: TextStyle(fontSize: 20, color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 30),
                            child: SizedBox(
                              width: 180,
                              height: 50,
                              child: TextButton(
                                  onPressed: () async {
                                    if(_formKey.currentState!.validate()) {
                                      dynamic result = await _auth.signInWithEmail(email, password);
                                      if(result == null) {
                                        setState(() {
                                          error = 'Wrong email or password';
                                        });
                                      } else {
                                        Navigator.pushReplacementNamed(context, 'Home');
                                      }
                                    }
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          BeveledRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.white,
                                                  width: 0.5,
                                                  style: BorderStyle.solid))),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromRGBO(42, 59, 113, 1))),
                                  child: const Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        letterSpacing: 1),
                                  )),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 100),
                                width: MediaQuery.of(context).size.width,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "About Spacey",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromRGBO(
                                                      135, 135, 135, 1)),
                                            )
                                          ]),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100))),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          Color.fromRGBO(
                                                              87, 136, 239, 1))),
                                              child: Text(
                                                "+",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
