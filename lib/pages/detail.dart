import 'dart:ui';

import 'package:fake_saldo_atm/utils/var_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/img/fakesaldo-lyr1.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image.asset(
                    'assets/img/fakesaldo-lyr2.png',
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                  Positioned(
                    top: 70,
                    child: Container(
                      padding: EdgeInsets.only(left: 16),
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                DateFormat.Md('id').format(VarGlobal.date),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                DateFormat('hh:mm:ss').format(VarGlobal.date),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                VarGlobal.rek,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Rp.' +
                                    NumberFormat('###,000')
                                        .format(VarGlobal.saldo),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
