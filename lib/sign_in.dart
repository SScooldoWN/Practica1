import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/log_in.dart';
import 'package:practica_integradora_uno/utils/constants.dart';


class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
 var valor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueS,
        body: Container(
            child: Column(
              children: <Widget>[
               Center( child: Image.asset("lib/assets/image/cupping.png",
           height: 150,), 
        ),
              ]
            )));
  }
}
