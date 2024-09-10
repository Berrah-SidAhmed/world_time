import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Getdata {
final String flag ;
  final String Countryname ;

  final String link ;

  Getdata({required this.flag, required this.Countryname,required this.link});

  late bool isday;
  late String Real;
  late String Location;
  getdatat() async {
    Response result =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$link'));
    Map receivedData = jsonDecode(result.body);

    DateTime Timenow = DateTime.parse(receivedData["datetime"]);
    
    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));
  
    DateTime Realtime = Timenow.add(Duration(hours: offset));
    Real = DateFormat('hh:mm a ').format(Realtime);
    Location = receivedData["timezone"];
    if (Realtime.hour > 6 && Realtime.hour < 20) {
      isday = true;
    } else {
      isday = false;
    }
  }
}
