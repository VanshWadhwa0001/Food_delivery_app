import 'package:flutter/material.dart';
import 'package:food_order_app/Screen/Card_scr.dart';
import 'package:food_order_app/Screen/Fovt.scr.dart';
import 'package:food_order_app/Screen/Main_scr.dart';
import 'package:food_order_app/Screen/Profile_scr.dart';
class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int selected = 0;
  List<Widget>src=<Widget>[
    Main_scr(),
    Fovt_scr(),
    Card_scr(),
    Profile_Scr()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: src[selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          selectedItemColor: Colors.black,
          showUnselectedLabels: true,
          onTap: (index){
          selected=index;
          setState(() {

          });
          },
          items:const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Card"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
      ]),
    );
  }
}
