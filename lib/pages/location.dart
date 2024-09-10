import 'package:flutter/material.dart';
import 'package:meteoapi/classes/getdata.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<Getdata> Allcountry = [
        Getdata(
        link: 'Africa/Algiers',
        Countryname: 'Algeria - Algiers',
        flag:'assets/algeria.png'),
        Getdata(
        link: 'Asia/Gaza',
        Countryname: 'Gaza - Pelestine',
        flag: 'assets/palestine.png'),
    Getdata(
        link: 'Africa/Cairo', Countryname: 'Egypt - Cairo', flag: 'assets/egypt.png'),
    Getdata(
        link: 'Africa/Tunis',
        Countryname: 'Tunisia - Tunis',
        flag: 'assets/tunisia.png'),

    Getdata(
        link: 'Australia/Sydney',
        Countryname: 'Australia - Sydney',
        flag: 'assets/australia.png'),
    Getdata(
        link: 'America/Toronto',
        Countryname: 'Canada - Toronto',
        flag: 'assets/canada.png'),
    Getdata(
        link: 'Asia/Riyadh',
        Countryname: '	Saudi Arabia - Riyadh',
        flag: 'assets/sa.png'),
    Getdata(
        link: 'Asia/Colombo', Countryname: 'Colombia - Colombo', flag: 'assets/colombia.png'),
    Getdata(
        link: 'Asia/Dubai',
        Countryname: 'Dubai - Dubai',
        flag: 'assets/dubai.png'),
    Getdata(
        link: 'Asia/Qatar',
        Countryname: 'Qatar',
        flag: 'assets/qatar.png'),
    Getdata(
        link: 'Asia/Tokyo',
        Countryname: 'Tokyo',
        flag: 'assets/japan.png'),
    Getdata(
        link: 'Europe/Istanbul',
        Countryname: 'Istanbul',
        flag: 'assets/turkey.png'),
    Getdata(
        link: 'Europe/Paris',
        Countryname: '	Paris - France ',
        flag: 'assets/france.png'),

    Getdata(
        link: 'Europe/Rome',
        Countryname: 'Rome - Italy',
        flag: 'assets/world.png'),
    Getdata(
        link: 'Europe/Warsaw',
        Countryname: 'Warsaw - Poland',
        flag: 'assets/poland.png'),
    Getdata(
        link: 'Indian/Maldives',
        Countryname: 'Maldives - India',
        flag: 'assets/maldives.png'),

    Getdata(
        link: 'Asia/Hong_Kong',
        Countryname: 'Hong_Kong',
        flag: 'assets/Hong_Kong.png'),
                        
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
        appBar: AppBar(),
        body: SizedBox(
            child: ListView.builder(
                itemCount: Allcountry.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () async {
                          Getdata Clickedcountry = Allcountry[index];
                          await Clickedcountry.getdatat();
                          Navigator.pop(context, {
                            "timenow": Clickedcountry.Real,
                            "Location": Clickedcountry.Location,
                            "Isday": Clickedcountry.isday
                          });
                        },
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(Allcountry[index].flag),
                        ),
                        title: Text(
                          Allcountry[index].Countryname,
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              fontFamily: "font44"),
                        ),
                      ),
                    ),
                  );
                })));
  }
}
