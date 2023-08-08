import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselModel extends StatelessWidget {
  const CarouselModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.35,
        padding: EdgeInsets.all(15),
        child: CarouselSlider(
            items: [
              Container(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                offset: Offset(1, 2),
                                color: Colors.grey.withOpacity(0.8))
                          ],
                          borderRadius: BorderRadius.circular(17),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 255, 117, 202),
                                Color.fromARGB(255, 42, 152, 255),
                              ])),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: Image.asset(
                          'assets/img/eye-glasses.png',
                          height: 150,
                        )),
                    Positioned(
                      top: 10,
                      left: 15,
                      child: Text(
                        'Wajib digunakan \nuntuk \nFLEXING!!',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                shadows: [
                              Shadow(
                                  blurRadius: 4,
                                  offset: Offset(2, 1),
                                  color: Colors.black.withOpacity(0.3))
                            ],
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 35)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                offset: Offset(1, 2),
                                color: Colors.grey.withOpacity(0.8))
                          ],
                          borderRadius: BorderRadius.circular(17),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 252, 96, 244),
                                Color.fromARGB(255, 70, 232, 238)
                              ])),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: Image.asset(
                          'assets/img/emoji.png',
                          height: 150,
                        )),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Text(
                        'Isi saldonya dikit aja, \nkalo temen \nmau \nNGUTANG haha',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                shadows: [
                              Shadow(
                                  blurRadius: 4,
                                  offset: Offset(2, 1),
                                  color: Colors.black.withOpacity(0.3))
                            ],
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30)),
                      ),
                    )
                  ],
                ),
              ),
            ],
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 3),
              disableCenter: false,
              pauseAutoPlayInFiniteScroll: false,
              viewportFraction: 1,
            )));
  }
}
