import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map Now = {};
  @override
  Widget build(BuildContext context) {
    Now = Now.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : Now;
    String bgimg = Now["isDay"] ? "day.json" : "night.json";
    return Scaffold(
      backgroundColor: Now["isDay"] ? Colors.white : Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            ElevatedButton.icon(
              onPressed: () async {
                dynamic resulta =
                    await Navigator.pushNamed(context, '/location');

                setState(() {
                  if (resulta == null) {
                      Now = {
                      "timenow": "Please Chose",
                      "Location": "  Location",
                      "isDay": false
                    };
                    
                  }else{
                  Now = {
                      "timenow": resulta["timenow"],
                      "Location": resulta['Location'],
                      "isDay": resulta["Isday"]
                    };
                  }
                });
              },
              style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(EdgeInsets.all(20)),
                  elevation: const WidgetStatePropertyAll(15),
                  shadowColor: WidgetStatePropertyAll(
                      Now["isDay"] ? Colors.blue[300] : Colors.deepPurple[500]),
                  foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(Now["isDay"]
                      ? Colors.blue[300]
                      : Colors.deepPurple[500])),
              label: const Text(
                'Change Country',
                style: TextStyle(fontFamily: "font22", fontSize: 20),
              ),
              icon: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 50,
            ),
            Lottie.asset("assets/$bgimg",
                width: 300, height: 300, fit: BoxFit.fill),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
              decoration: BoxDecoration(
                color: Now["isDay"] ? Colors.blue[300] : Colors.deepPurple[500],
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Now["isDay"]
                        ? Colors.blue.withOpacity(0.5)
                        : Colors.deepPurple,
                    spreadRadius: 5,
                    blurRadius: 9,
                    offset: const Offset(0, 6), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    Now["timenow"],
                    style: const TextStyle(
                    
                        fontSize: 20,
                        fontFamily: "font11",
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    Now["Location"],
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "font33",
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
            
                ],
              ),
            ),
            const SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}
