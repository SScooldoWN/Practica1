import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cups/item_cups_details.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';

class ItemCups extends StatefulWidget {
  final ProductCup cup;
  ItemCups({
    Key key,
    @required this.cup,
  }) : super(key: key);

  @override
  _ItemCupsState createState() => _ItemCupsState();
}

class _ItemCupsState extends State<ItemCups> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () => _openCupsDetails(context),
    child: Card(  
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child:Row(
        children: <Widget>[
      Column(children : <Widget>[
        Text("Tazas", textAlign: TextAlign.left),
        Text("${widget.cup.productTitle}",
        textAlign: TextAlign.left,
        ),
        Text("${widget.cup.productPrice}",
        textAlign: TextAlign.left,
        ),
      ],
      ),
        Expanded(child:
        Container(
          child: Image.network(widget.cup.productImage),
         width: 100, height: 100,
        ),
        flex: 6
        ),
        Expanded(child: 
        Container(
          padding: EdgeInsets.only(bottom: 80),
          child: IconButton(icon: Icon(Icons.favorite, color: widget.cup.liked ?
          Colors.red : Colors.black),
         onPressed: () { 
           setState(() {
             widget.cup.liked =
            !widget.cup.liked;
           });
         }
        ),
        ),
        flex: 1,
        ),
        ],
      ), 
    ),
    );
  }

    _openCupsDetails(BuildContext context) async {
   await Navigator.of(context).push(
     
      MaterialPageRoute(
        builder: (_) => CupDetails(product: widget.cup)  
      )
    );
  }
}

