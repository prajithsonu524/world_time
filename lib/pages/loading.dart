import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime value =
        WorldTime(location: 'India', flag: 'India.png', url: 'Asia/Kolkata');
    await value.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': value.location,
      'flag': value.flag,
      'time': value.time,
      'isDayTime': value.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitFadingFour(
        color: Colors.blue,
        size: 50.0,
      )),
    );
  }
}
