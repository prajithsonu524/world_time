import 'package:flutter/material.dart';
import './loading.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = result;
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data['location'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          letterSpacing: 2.0)),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 66.6,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
