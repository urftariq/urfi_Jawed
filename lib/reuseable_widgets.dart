import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EhtishamContainer extends StatelessWidget {
  const EhtishamContainer({
    super.key,
    required this.userText,
    required this.myColor
    
  });

  final String userText;
  final Color myColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: myColor,
          borderRadius: BorderRadius.circular(14),
          image: const DecorationImage(image: NetworkImage('url'))
      ),
      child: Center(
        child: Text(userText, style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400
        ),),
      ),
    );
  }

}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.passHide,
    this.passIcon,
    required this.textController,
    required this.errorMsg,
    this.limiter
  });

  final String label;
  final String hint;
  final Icon icon;

  final IconButton? passIcon;
  final bool passHide;

  final TextEditingController textController;

  final String errorMsg;

  final bool? limiter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: textController,
        inputFormatters: [
          limiter==true?LengthLimitingTextInputFormatter(6):LengthLimitingTextInputFormatter(-1),
        ],
        maxLength: limiter==true?6:null,
        validator: (value){
          if (value == null || value.isEmpty || value==" ") {
            return errorMsg;
          }
          if(value.length < 6){
            return "Field Must be 6 Or More in Digit";
          }
        },
        decoration: InputDecoration(
            label: Text(label),
            hintText: hint,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(14)
            ),
            prefixIcon: icon,
          suffixIcon: passIcon
        ),
        obscureText: passHide,
        obscuringCharacter: '*',
      ),
    );
  }
}

class kuchbhi extends StatelessWidget {
  const kuchbhi({
    super.key,
    required this.kuchbhinaam,
    required this.kuchbhitasver
  });

  final String kuchbhinaam;
  final String kuchbhitasver;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(kuchbhitasver)),
      ),
      child: Center(child: Text(kuchbhinaam),),
    );
  }
}

class MovieStack extends StatelessWidget {
  const MovieStack({
    Key? key,
    required this.image,
    required this.movieName,
    required this.network,
    required this.startDate,
    required this.status
  }) : super(key: key);

  final String image;
  final String movieName;
  final String startDate;
  final String network;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
        Container(
        color: Colors.black,
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    child: Row(
    children: [
    Container(
    width: 120,
    height: 60,
    decoration: BoxDecoration(
    //color: Colors.blue,
    borderRadius: BorderRadius.circular(20),
    image: DecorationImage(
    image: NetworkImage(image)

    )
    ),
    ),
    Container(
    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
    Text(movieName,style: const TextStyle(color: Colors.white),),
    Text(startDate,style: const TextStyle(color: Colors.white),),
    Text(network,style: const TextStyle(color: Colors.white),),
    Text(status,style: const TextStyle(color: Colors.white),)
    ],
    ),
    )
    ],
    ),
    )]);}}
