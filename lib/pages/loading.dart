import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meteoapi/classes/getdata.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getdataloadingpage()async {
    Getdata Allcountry = Getdata(
      flag: "assets/algeria.png", Countryname: "Algeria", link: "Africa/Algiers"
    );
    await Allcountry.getdatat();

    Navigator.pushReplacementNamed(context, '/home',
        arguments: {"timenow": Allcountry.Real, 'Location': Allcountry.Location, "isDay": Allcountry.isday});
    // print(Realtime.hour);
  }

  @override
  void initState() {
    super.initState();
    getdataloadingpage();
    
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitSpinningLines(
        color: Colors.black,
        size: 100,
      ),
    );
  }
  
}
