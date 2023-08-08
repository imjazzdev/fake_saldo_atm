import 'dart:ui';

import 'package:fake_saldo_atm/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../main.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/img/start.jpg',
                  ),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height * 0.28,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Text(
                            textAlign: TextAlign.center,
                            'Ini Cuma Buat \nNgeprank Aja Ya',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text('jangan disalah gunakan',
                            style: GoogleFonts.poppins(),
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.blue.shade400,
                                highlightColor: Colors.blue.shade200,
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.red[200]),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Text('OK',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey[50],
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 30,
                  right: 30,
                  child: Icon(
                    Icons.error_outline_sharp,
                    color: Colors.red,
                    shadows: [
                      Shadow(
                        blurRadius: 1.5,
                      )
                    ],
                    size: 40,
                  ))
            ],
          ),
        )
      ],
    ));
  }
}
