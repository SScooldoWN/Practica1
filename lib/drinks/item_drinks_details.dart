import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';

class DrinkDetails extends StatefulWidget {
  final ProductDrinks product;
  const DrinkDetails({Key key, @required this.product}) : super(key: key);

  @override
  _DrinkDetailsState createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  bool small = false, medium = false, big = false;
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
                    label: Text("Chico"),
                    backgroundColor: small ? Colors.purple : Colors.grey,
                  ),
                  onTap: () {
                    setState(
                      () {
                        small = !small;
                        medium = false;
                        big = false;

                        widget.product.productSize = ProductSize.CH;
                        widget.product.productPrice =
                            widget.product.productPriceCalculator();
                      },
                    );
                  }),
              GestureDetector(
                  child: Chip(
                    label: Text("Mediano"),
                    backgroundColor: medium ? Colors.purple : Colors.grey,
                  ),
                  onTap: () {
                    setState(
                      () {
                        small = false;
                        medium = !medium;
                        big = false;

                        widget.product.productSize = ProductSize.M;
                        widget.product.productPrice =
                            widget.product.productPriceCalculator();
                      },
                    );
                  }),
              GestureDetector(
                  child: Chip(
                    label: Text("Grande"),
                    backgroundColor: big ? Colors.purple : Colors.grey,
                  ),
                  onTap: () {
                    setState(
                      () {
                        small = false;
                        medium = false;
                        big = !big;

                        widget.product.productSize = ProductSize.G;
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
