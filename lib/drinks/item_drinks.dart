import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/drinks/item_drinks_details.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';

class ItemDrinks extends StatefulWidget {
  final ProductDrinks drink;
  ItemDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemDrinksState createState() => _ItemDrinksState();
}

class _ItemDrinksState extends State<ItemDrinks> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () => _openDrinksDetails(context),
    child: Card(  
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child:Row(
        children: <Widget>[
      Column(children : <Widget>[
        Text("Cafe", textAlign: TextAlign.left),
        Text("${widget.drink.productTitle}",
        textAlign: TextAlign.left,
        ),
        Text("${widget.drink.productPrice}",
        textAlign: TextAlign.left,
        ),
      ],
      ),
        Expanded(child:
        Container(
          child: Image.network(widget.drink.productImage),
         width: 100, height: 100,
        ),
        flex: 6
        ),
        Expanded(child: 
        Container(
          padding: EdgeInsets.only(bottom: 80),
          child: IconButton(icon: Icon(Icons.favorite, color: widget.drink.liked ?
          Colors.red : Colors.black),
         onPressed: () { 
           setState(() {
             widget.drink.liked =
            !widget.drink.liked;
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

    _openDrinksDetails(BuildContext context) async {
   await Navigator.of(context).push(
     
      MaterialPageRoute(
        builder: (_) => DrinkDetails(product: widget.drink)  
      )
    );
  }
}

