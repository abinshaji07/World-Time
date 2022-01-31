import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {


  void setupwordtime() async
  {
    worldtime instance = worldtime(
        location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin');
    await instance.getTime();
   Navigator.pushReplacementNamed(context, "/home", arguments: {

     "location": instance.location,
      'flag': instance.flag,
      'time': instance.time,
     'isDaytime':instance.isDaytime,

   });
  }


  @override
  void initState() {
    super.initState();
    setupwordtime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
          child: SpinKitSpinningLines(
            color: Colors.white,
            size: 90.0,
          ),
      ),
    );
  }
}
