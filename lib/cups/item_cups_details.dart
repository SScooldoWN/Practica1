import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class CupDetails extends StatefulWidget {
  final ProductCup product;
  const CupDetails({Key key, @required this.product}) : super(key: key);

  @override
  _CupDetailsState createState() => _CupDetailsState();
}

class _CupDetailsState extends State<CupDetails> {
  bool white = false, skin = false, blue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.productTitle),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .75,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.network(widget.product.productImage,
                      fit: BoxFit.fill),
                ),
              ),
              Positioned(
                top: 2,
                right: 2,
                child: IconButton(
                  icon: Icon(Icons.favorite,
                      color: widget.product.liked ? Colors.red : Colors.black),
                  onPressed: () => setState(
                    () {
                      widget.product.liked = !widget.product.liked;
                    },
                  ),
                ),
              ),
            ],
          ),
          Text(widget.product.productTitle),
          Text(widget.product.productDescription),
          Row(
            children: <Widget>[
              Text("Tamaños Disponible"),
              Text(" ${widget.product.productPrice}",
                  textAlign: TextAlign.right),
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                  child: Chip(
                    label: Text("Blanco"),
                    backgroundColor: white ? Colors.white : Colors.grey,
                  ),
                  onTap: () {
                    setState(
                      () {
                        white = !white;
                        skin = false;
                        blue = false;

                        widget.product.productColor = ProductColor.W;
                        widget.product.productPrice =
                            widget.product.productPriceCalculator();
                      },
                    );
                  }),
              GestureDetector(
                  child: Chip(
                    label: Text("Piel"),
                    backgroundColor: skin ? orangeL : Colors.grey,
                  ),
                  onTap: () {
                    setState(
                      () {
                        white = false;
                        skin = !skin;
                        blue = false;

                        widget.product.productColor = ProductColor.S;
                        widget.product.productPrice =
                            widget.product.productPriceCalculator();
                      },
                    );
                  }),
              GestureDetector(
                  child: Chip(
                    label: Text("Azul"),
                    backgroundColor: blue ? blueR : Colors.grey,
                  ),
                  onTap: () {
                    setState(
                      () {
                        white = false;
                        skin = false;
                        blue = !blue;

                        widget.product.productColor = ProductColor.B;
                        widget.product.productPrice =
                            widget.product.productPriceCalculator();
                      },
                    );
                  }),
            ],
          ),
          Row(
            children: <Widget>[
              MaterialButton(
                  child: Text("AGREGAR AL\n CARRITO"), onPressed: null),
              MaterialButton(child: Text("COMPRAR AHORA"), onPressed: null)
            ],
          ),
        ],
      ),
    );
  }
}