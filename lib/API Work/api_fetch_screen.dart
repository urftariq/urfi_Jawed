import 'dart:convert';

import 'package:fastpro/API%20Work/api_desc_screen.dart';
import 'package:fastpro/API%20Work/api_services.dart';
import 'package:fastpro/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Fetch Screen"),
      ),
      body: FutureBuilder(
        future: ApiServices.apiFetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            Map map = jsonDecode(snapshot.data);
            List myData = map["tv_shows"];

            return ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index) {
                String movieName = myData[index]["name"];
                String movieImage = myData[index]["image_thumbnail_path"];
                String movieNetwork = myData[index]["network"];
                String movieDate = myData[index]["start_date"];
                String movieStatus = myData[index]["status"];
                int movieID = myData[index]["id"];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DescriptionScreen(movieID: movieID),
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Movie ID: $movieID")));
                  },
                  child: MovieStack(
                      image: movieImage,
                      movieName: movieName,
                      network: movieNetwork,
                      startDate: movieDate,
                      status: movieStatus),
                );
              },
            );
          }

          if (snapshot.hasError) {
            return const Icon(
              Icons.error,
              color: Colors.red,
            );
          }

          return Container();
        },
      ),
    );
  }
}
