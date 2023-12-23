
import 'package:fastpro/dashboard_screen.dart';
import 'package:fastpro/external_screen.dart';
import 'package:fastpro/listview_builder_screen.dart';
import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {

  int currentIndex = 0;

  void pageShifter(index){
    setState(() {
      currentIndex = index;
    });
  }

  List screen = const[
    MyHome(),
    Column(),
    ExternalScreen(),
    ListViewScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.red.shade400,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(color: Colors.red.shade400),
          selectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(color: Colors.black),
          currentIndex: currentIndex,
          onTap: pageShifter,
          items: const [
        BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            label: "Contact",
            icon: Icon(Icons.phone)),
        BottomNavigationBarItem(
            label: "Product",
            icon: Icon(Icons.category)),
        BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person))
      ]),
    );
  }
}
