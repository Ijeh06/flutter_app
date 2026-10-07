import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(
              left: 80.0,
              right: 80,
              top: 160,
              bottom: 40,
            ),
            child: Image.asset('lib/images/carlos.png'),
          ),

          //Get your player cards
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Get your player cards',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //fresh cards everyday
          Text('Fresh cards everyday'),
          //get started button

          const Spacer(),

          GestureDetector(
            onTap: () {
              // Navigate to the next page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Text('Get Started', style: TextStyle(color: Colors.white)),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
