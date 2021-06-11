import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MonitorPage extends StatefulWidget {
  const MonitorPage({Key? key}) : super(key: key);

  @override
  _MonitorPageState createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  UserAccelerometerEvent pastEvent = new UserAccelerometerEvent(0, 0, 0);

  String state = "";

  String state_v = "";

  double sensitivity = 2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Monitor Page"),
      ),
      body: Column(
        children: [
          IconButton(
            icon: Icon(
              Icons.check,
            ),
            onPressed: () {
              userAccelerometerEvents.listen((UserAccelerometerEvent event) {
                setState(() {
                  pastEvent = event;

                  if (pastEvent.x > (0.1 * sensitivity)) {
                    state = "Moving Right ";
                  } else if (pastEvent.x < (-0.1 * sensitivity)) {
                    state = "Moving Left ";
                  } else {
                    state = "";
                  }

                  if (pastEvent.y > (0.1 * sensitivity)) {
                    state_v = "Moving Up ";
                  } else if (pastEvent.y < (-0.1 * sensitivity)) {
                    state_v = "Moving Down ";
                  } else {
                    state_v = "";
                  }
                });
              });
            },
          ),
          Text(
            "X: " +
                pastEvent.x.toStringAsFixed(2) +
                "\nY: " +
                pastEvent.y.toStringAsFixed(2),
          ),
          Text(state + " " + state_v),
        ],
      ),
    );
  }
}
