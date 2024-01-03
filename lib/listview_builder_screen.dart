import 'package:fastpro/reuseable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List names = ["Huzaifa", "Ehtisham", "Mehdi", "Tariq", "Basit"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ListView Builder Screen"),
        ),
        body: ListView.builder(
          itemCount: 5,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Fluttertoast.showToast(
                      msg: names[index],
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
                child: kuchbhi(
                    kuchbhinaam: names[index],
                    kuchbhitasver: ''),
              );
            },)
      ),
    );
  }
}


