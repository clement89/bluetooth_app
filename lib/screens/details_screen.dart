import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({@required this.device});
  final BluetoothDevice device;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DETAILS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'DEVICE ID IS:',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('${device.id}',
                style: TextStyle(
                  color: Colors.black,
                )),
          )),
        ],
      ),
    );
  }
}
