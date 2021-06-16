import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MonitorPage extends StatefulWidget {
  const MonitorPage({Key? key}) : super(key: key);

  @override
  _MonitorPageState createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  double speedInMps = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speed"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Geolocator.getPositionStream(
                      forceAndroidLocationManager: true,
                      intervalDuration: Duration(milliseconds: 10),
                      distanceFilter: 2,
                      desiredAccuracy: LocationAccuracy.best)
                  .listen((position) {
                setState(() {
                  speedInMps = position.speed; // this is your speed
                });
              });
            },
            icon: Icon(Icons.check),
          ),
          Text(
            speedInMps.toStringAsPrecision(3),
          ),
        ],
      ),
    );
  }
}
