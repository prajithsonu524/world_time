import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;
  bool isDayTime = true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getData() async {
    try {
      String endpoint = 'http://worldtimeapi.org/api/timezone/$url';
      Response response = await get(Uri.parse(endpoint));

      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String hOffset = data['utc_offset'].substring(1, 3);
      String mOffset = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now = now.add(
          Duration(hours: int.parse(hOffset), minutes: int.parse(mOffset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error : $time');
      time = 'Could not load the time.....';
    }
  }
}
