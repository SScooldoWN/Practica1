import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cups/item_cups.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';

class CupsPage extends StatelessWidget {
  final List<ProductCup> cupsList;
  CupsPage({
    Key key,
    @required this.cupsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tazas"),
      ),
      body: ListView.builder(
        itemCount: cupsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCups(
            cup: cupsList[index],
          );
        },
      ),
    );
  }
}
