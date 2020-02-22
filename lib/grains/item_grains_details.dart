import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

class GrainDetails extends StatefulWidget {
  final ProductGrains product;
  const GrainDetails({Key key, @required this.product}) : super(key: key);

  @override
  _GrainDetailsState createState() => _GrainDetailsState();
}

class _GrainDetailsState extends State<GrainDetails> {
  bool g = false, k = false;
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
                    label: Text("250 g"),
                    backgroundColor: g ? Colors.purple : Colors.grey,
                  ),
                  onTap: () {
                    setState(
                      () {
                        g = !g;
                        k = false;

                        widget.product.productWeight = ProductWeight.CUARTO;
                        widget.product.productPrice =
                            widget.product.productPriceCalculator();
                      },
                    );
                  }),
              GestureDetector(
                  child: Chip(
                    label: Text("1K"),
                    backgroundColor: k ? Colors.purple : Colors.grey,
                  ),
                  onTap: () {
                    setState(
                      () {
                        g = false;
                        k = !k;

                        widget.product.productWeight = ProductWeight.KILO;
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
