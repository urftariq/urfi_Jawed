import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExternalScreen extends StatefulWidget {
  const ExternalScreen({super.key});

  @override
  State<ExternalScreen> createState() => _ExternalScreenState();
}

class _ExternalScreenState extends State<ExternalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Here is your text test",style: GoogleFonts.whisper(
          fontSize: 30,
          fontWeight: FontWeight.w800
        ),)
      ),
    );
  }
}
