import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/log_in.dart';
import 'package:practica_integradora_uno/sign_in.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class Enter extends StatelessWidget {
  const Enter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( child: Scaffold(backgroundColor: blueS, body: Column(
      children: <Widget>[
        Expanded(
          child: Image.asset("lib/assets/image/cupping.png",
           height: 150,
        ),
        ),
        Expanded(
          child:
          MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 50),
            color: grayL,
            onPressed: () {Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => SignIn()
              ),
            );
            },
            child: Text("REGISTRATE"),
          ),
          ),
        Expanded(
          child: MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 62),
            color: grayL,
            onPressed: () {Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => LogIn()
              ),
              );
              },
            child: Text("INGRESA"),
            ),
            ), 
      ],
    ),
    )
    );
  }
}