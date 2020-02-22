// TODO: Crear producto "ProductCup" siguiendo la logica de Drinks y Grains
// TODO: Agregar al ProductRepository una lista de estos productos.
import 'dart:math';

import 'package:flutter/foundation.dart';

enum ProductColor {W, S, B}

class ProductCup {
  String productTitle; // nombre del producto
  String productDescription; // descripcion del producto
  String productImage; // url de imagen del producto
  ProductColor productColor; // Color del producto
  double productPrice; // precio del producto autocalculado
  int productAmount; // cantidad de producto por comprar
  bool liked;

   ProductCup({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productColor,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo al weight del producto
    productPrice = productPriceCalculator();
  }

  double productPriceCalculator() {
    if (this.productColor == ProductColor.W)
      return (20 + Random().nextInt(40)).toDouble();
    if (this.productColor == ProductColor.S)
      return (40 + Random().nextInt(60)).toDouble();
    if (this.productColor == ProductColor.B)
      return (60 + Random().nextInt(80)).toDouble();
    return 9999.0;
  }
}