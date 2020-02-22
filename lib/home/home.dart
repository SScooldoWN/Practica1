import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cups/cupsPage.dart';
import 'package:practica_integradora_uno/drinks/drinks_page.dart';
import 'package:practica_integradora_uno/grains/grainsPage.dart';
import 'package:practica_integradora_uno/home/item_home.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';
import 'package:practica_integradora_uno/profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _productsDrinks;
  List _productsGrains;
  List _productsCups;
  
  @override
  void initState() { 

    _productsDrinks = ProductRepository.loadProducts(ProductType.BEBIDAS);
    _productsGrains = ProductRepository.loadProducts(ProductType.GRANO);    
    _productsCups = ProductRepository.loadProducts(ProductType.TAZAS);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openDrinksPage,
            child: ItemHome(
              title: "Bebidas",
              image: "https://i.blogs.es/723857/cafe_como/450_1000.jpg",
            ),
          ),
          GestureDetector(
          onTap: _openGrainsPage,
          child: ItemHome(
            title: "Cafe en grano",
            image: "https://www.elplural.com/uploads/s1/34/84/2/cafe.jpeg",
          ),
          ),
          GestureDetector(
          onTap: _openCupsPage,
          child: ItemHome(
            title: "Tazas",
            image:
                "https://walkingmexico.com/wp-content/uploads/2015/02/Viajografi%CC%81a-Las-7-mejores-tazas-de-cafe%CC%81-en-el-D.F.-1.jpg",
          ),
          ),
        ],
      ),
    );
  }

  void _openDrinksPage() async {
    // TODO: completar en navigator pasando los parametros a la pagina de DrinksPage

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DrinksPage(drinksList: _productsDrinks,
          );
        },
      ),
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return GrainsPage(grainsList: _productsGrains);
      },
      ),
    );
  }

  void _openCupsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return CupsPage(cupsList: _productsCups);
      }),
    );
  }
}
