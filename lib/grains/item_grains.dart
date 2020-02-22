import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/grains/item_grains_details.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grains;
  ItemGrains({
    Key key,
    @required this.grains,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () => _openGrainDetails(context),
    child: Card(  
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child:Row(
        children: <Widget>[
      Column(children : <Widget>[
        Text("Cafe en grano", textAlign: TextAlign.left),
        Text("${widget.grains.productTitle}",
        textAlign: TextAlign.left,
        ),
        Text("${widget.grains.productPrice}",
        textAlign: TextAlign.left,
        ),
      ],
      ),
        Expanded(child:
        Container(
          child: Image.network(widget.grains.productImage),
         width: 100, height: 100,
        ),
        flex: 6
        ),
        Expanded(child: 
        Container(
          padding: EdgeInsets.only(bottom: 80),
          child: IconButton(icon: Icon(Icons.favorite, color: widget.grains.liked ?
          Colors.red : Colors.black),
         onPressed: () { 
           setState(() {
             widget.grains.liked =
            !widget.grains.liked;
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

    _openGrainDetails(BuildContext context) async {
   await Navigator.of(context).push(
     
      MaterialPageRoute(
        builder: (_) => GrainDetails(product: widget.grains)  
      )
    );
  }
}

