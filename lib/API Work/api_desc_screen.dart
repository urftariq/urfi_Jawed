import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fastpro/API%20Work/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key , required this.movieID});

  final int movieID;
  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {

  List myColors = [Colors.red, Colors.green, Colors.purple, Colors.orange];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: ApiServices.apiDesc(widget.movieID),
          builder: (context, snapshot) {

            if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            }

            if(snapshot.hasData){
              Map map = jsonDecode(snapshot.data);
              String movieName = map["tvShow"]["name"];
              return Text(movieName);
            }

            if (snapshot.hasError) {
              return const Icon(Icons.error, color: Colors.red,);
            }

            return Container();
          },),
      ),
      body: FutureBuilder(
              future: ApiServices.apiDesc(widget.movieID),
              builder: (context, snapshot) {

              if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
              }

              if(snapshot.hasData){
              Map map = jsonDecode(snapshot.data);
              String movieName = map["tvShow"]["name"];
              String movieNetwork = map["tvShow"]["network"];
              String movieImage = map["tvShow"]["image_thumbnail_path"];
              String movieRating = map["tvShow"]["rating"];
              double mRate = double.parse(movieRating) / 2;
              List moviePictures = map["tvShow"]["pictures"];
              return Column(
                children: [

                  Stack(
                    children: [

                      const SizedBox(
                        width: double.infinity,
                        height: 242,
                      ),

                      CarouselSlider(
                          items: List.generate(
                              moviePictures.length,
                                  (index) =>Container(
                                  width: double.infinity,
                                  height: 180,
                                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(14),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage('${moviePictures[index]}'))
                                  ))),
                          options: CarouselOptions(
                              viewportFraction: 1,
                              autoPlay: true,
                              height: 180,
                              autoPlayInterval: const Duration(milliseconds: 1500)
                          )),

                      Positioned(
                        top: 80,
                        left: 30,
                        child: Container(
                          width: 120,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(movieImage))
                          ),
                        ),
                      ),


                      Positioned(
                          top: 180,
                          left: 155,
                          child: Text(movieName,style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),)),

                      Positioned(
                          top: 200,
                          left: 155,
                          child: Text("By: $movieNetwork",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),)),

                Positioned(
                  top: 220,
                  left: 155,
                  child: RatingBar.builder(
                  initialRating: mRate,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                  print(rating);
                  },
                  ),
                )
                    ],
                  ),



                ],
              );
              }

              if (snapshot.hasError) {
              return const Icon(Icons.error, color: Colors.red,);
              }

              return Container();
              },),
                  );
                }
}
