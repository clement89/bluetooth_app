import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBlue.instance.scanResults,
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data
                      .map(
                        (r) => ScanResultTile(
                          result: r,
                          onTap: () {
                            print('clicked');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DeviceScreen(device: r.device),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              StreamBuilder<bool>(
                stream: FlutterBlue.instance.isScanning,
                initialData: false,
                builder: (c, snapshot) {
                  if (snapshot.data) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        FlutterBlue.instance.stopScan();
                      },
                      icon: Icon(Icons.stop),
                      label: Text('Stop'),
                    );
                  } else {
                    return ElevatedButton.icon(
                      onPressed: () {
                        FlutterBlue.instance.startScan(
                          timeout: Duration(seconds: 4),
                        );
                      },
                      icon: Icon(Icons.search),
                      label: Text('Scan'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScanResultTile extends StatelessWidget {
  const ScanResultTile({@required this.result, this.onTap});

  final ScanResult result;
  final VoidCallback onTap;

  Widget _buildTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          result.device.name.length > 0 ? result.device.name : 'No name',
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          result.device.id.toString(),
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _buildTitle(context),
      leading: Icon(
        Icons.bluetooth,
        color: Colors.blue,
        size: 30.0,
      ),
      trailing: TextButton(
        child: Text('View'),
        onPressed: onTap,
      ),
      onTap: onTap,
    );
  }
}

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({@required this.device});

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
          Center(child: Text('${device.id}')),
        ],
      ),
    );
  }
}
