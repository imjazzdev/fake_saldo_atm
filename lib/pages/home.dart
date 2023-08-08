import 'dart:ui';

import 'package:fake_saldo_atm/models/carousel.dart';
import 'package:fake_saldo_atm/pages/detail.dart';
import 'package:fake_saldo_atm/utils/ads_manager.dart';
import 'package:fake_saldo_atm/utils/var_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController saldoController = TextEditingController();
  TextEditingController rekController = TextEditingController();
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    UnityAds.init(
      gameId: AdsManager.appid,
      onComplete: () => print('Initialization iklan Complete'),
      onFailed: (error, message) =>
          print('Initialization iklan gagal: $error $message'),
    );
    UnityAds.load(placementId: AdsManager.interAdPlacementId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: Colors.white,
            child: Image.asset(
              'assets/img/background2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    SliverToBoxAdapter(child: CarouselModel()),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pilih Tanggal',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      shadows: [Shadow(blurRadius: 1.5)],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                          _dateTime == null
                                              ? DateFormat('dd-MM-yyyy')
                                                  .format(DateTime.now())
                                              : DateFormat('dd-MM-yyyy')
                                                  .format(_dateTime),
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                fontSize: 18),
                                          )),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                offset: Offset(1, 2),
                                                color: Colors.grey
                                                    .withOpacity(0.8))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color.fromARGB(
                                                    255, 74, 223, 243),
                                                Color.fromARGB(
                                                    255, 103, 177, 238),
                                              ])),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2099),
                                      ).then((date) {
                                        setState(() {
                                          _dateTime = date!;
                                        });
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/img/calendar.png',
                                      height: 40,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Isi Saldo',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        shadows: [Shadow(blurRadius: 1.5)],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20))),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(18)
                                ],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.number,
                                controller: saldoController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '1 Milyar',
                                    hintStyle: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white.withOpacity(0.6)),
                                    )),
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        offset: Offset(1, 2),
                                        color: Colors.grey.withOpacity(0.8))
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(255, 74, 223, 243),
                                        Color.fromARGB(255, 103, 177, 238),
                                      ])

                                  // color: Colors.grey[100]
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Isi No. Rek',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      shadows: [Shadow(blurRadius: 1.5)],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              child: TextField(
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.number,
                                controller: rekController,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '1234567890',
                                    hintStyle: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white.withOpacity(0.6)),
                                    )),
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        offset: Offset(1, 2),
                                        color: Colors.grey.withOpacity(0.8))
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(255, 74, 223, 243),
                                        Color.fromARGB(255, 103, 177, 238),
                                      ])),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: InkWell(
                      onTap: () {
                        if (saldoController.text == '') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.orange.shade200,
                              content: Text('form nya gaboleh kosong ges',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(fontSize: 18)))));
                        }
                        setState(() {
                          VarGlobal.saldo = int.parse(saldoController.text);
                          VarGlobal.date = _dateTime;
                          rekController.text = VarGlobal.rek;
                        });
                        UnityAds.showVideoAd(
                            onFailed: (placementId, error, errorMessage) => (print(
                                'gagal menampilkan iklan karna $errorMessage')),
                            placementId: AdsManager.interAdPlacementId);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage()));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.amber,
                            highlightColor: Colors.amber.shade200,
                            child: Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        offset: Offset(1, 2),
                                        color: Colors.grey.withOpacity(0.8))
                                  ],
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          Text('OK',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 18),
                              ))
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
