import 'package:fake_saldo_atm/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitPage extends StatelessWidget {
  CounterCubit myCounter = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BlocConsumer(
          //   builder: (context, state) {
          //     return Text(
          //       state.toString(),
          //       style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          //     );
          //   },
          //   listener: (context, state) {
          //     ScaffoldMessenger.of(context)
          //         .showSnackBar(SnackBar(content: Text('BARANG HABIS')));
          //   },
          //   listenWhen: (previous, current) {
          //     if (current == 15) {
          //       return true;
          //     } else {
          //       return false;
          //     }
          //   },
          // ),
          // BlocBuilder<CounterCubit, int>(
          //   bloc: myCounter,
          //   builder: (context, state) {
          //     return Text(
          //       state.toString(),
          //       style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          //     );
          //   },
          // ),

          Container(
            height: 150,
            width: 150,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Material(
                  color: Colors.amber,
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
                Material(
                  color: Colors.amber,
                  child: InkWell(
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '0',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.decrement();
                  },
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    myCounter.increment();
                  },
                  icon: Icon(Icons.add)),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
