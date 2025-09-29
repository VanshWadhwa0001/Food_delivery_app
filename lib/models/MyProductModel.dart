import 'dart:ui';

import 'package:flutter/material.dart';

class MyProductModel{
  final String image,name,category;
  final double price,rate,distance;
  final Color colo;

  MyProductModel({
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.rate,
    required this.distance,
    required this.colo,
});
}
List<MyProductModel> myProductModel = [
  MyProductModel(
    image: 'assets/sapporo_miso_ramen.png',
    name: 'Sapporo Miso',
    price: 300,
    rate: 5,
    distance: 150,
    category: "Ramen",
    colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/kurume_ramen.png',
    name: 'Kurume Ramen',
    price: 270,
    rate: 4.9,
    distance: 6,
    category: "Ramen",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/hakata_ramen.png',
    name: 'Hakata Ramen',
    price: 300,
    distance: 19,
    rate: 4.8,
    category: "Ramen",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/shrimp_fried_rice.png',
    name: 'Shrimp Fried Rice',
    price: 200,
    distance: 8,
    rate: 4.5,
    category: "Ramen",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/fullset_ramen.png',
    name: 'Fullset Ramen',
    price: 59,
    distance: 11,
    rate: 4.7,
    category: "Ramen",
      colo: Colors.black
  ),
  //for burger
  MyProductModel(
    image: 'assets/bacon_burger.png',
    name: 'Bacon burger',
    price: 60,
    distance: 10,
    rate: 5.0,
    category: "Burger",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/beef_burger.png',
    name: 'Fried Chicken Burger',
    price: 80,
    distance: 5,
    rate: 4.7,
    category: "Burger",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/cheese-burger.png',
    name: 'Cheese Burger',
    price: 40,
    distance: 100,
    rate: 4.5,
    category: "Burger",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/double_burger.png',
    name: 'Double_Patty_Burger',
    price: 150,
    distance: 20,
    rate: 5.0,
    category: "Burger",
      colo: Colors.black
  ),
  // for salad
  MyProductModel(
    image: 'assets/gemelli.png',
    name: 'Gemelli Pasta',
    price: 70,
    distance: 6,
    rate: 5.0,
    category: "Pasta",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/Rotellle.png',
    name: 'Rotellle Pasta',
    price: 100,
    distance: 2,
    rate: 4.8,
    category: "Pasta",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/Bow tie.png',
    name: 'Bow Tie Pasta',
    price: 40,
    distance: 4,
    rate: 4.8,
    category: "Pasta",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/ditalini.png',
    name: 'Ditalini Pasta',
    price: 80,
    distance: 6,
    rate: 4.5,
    category: "Pasta",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/pizza1.png',
    name: 'Veg Delight Pizza',
    price: 300,
    distance: 30,
    rate: 5,
    category: "Pizza",
      colo:Colors.black
  ),
  MyProductModel(
    image: 'assets/pizza11.png',
    name: 'Chicken Pizza',
    price: 400,
    distance: 40,
    rate: 4.3,
    category: "Pizza",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/pizza11.png',
    name: 'Grilled Chicken Pizza',
    price: 400,
    distance: 40,
    rate: 4.3,
    category: "Pizza",
      colo: Colors.black
  ),
  MyProductModel(
    image: 'assets/pizza 1111.png',
    name: 'Veggie Pizza',
    price: 400,
    distance: 40,
    rate: 4.3,
    category: "Pizza",
      colo: Colors.black
  ),
];