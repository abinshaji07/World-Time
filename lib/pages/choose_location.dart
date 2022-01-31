import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class choose_location extends StatefulWidget {
  const choose_location({Key? key}) : super(key: key);

  @override
  _chooselocationState createState() => _chooselocationState();
}

class _chooselocationState extends State<choose_location> {

  List<worldtime> locations = [
  worldtime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
  worldtime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
  worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
  worldtime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
  worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
  worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
];
 void updateTime(index) async{
   worldtime instance = locations[index];
   await instance.getTime();
   Navigator.pop(context,{
     "location": instance.location,
     'flag': instance.flag,
     'time': instance.time,
     'isDaytime':instance.isDaytime,


   });
   
 }

  @override
  Widget build(BuildContext context) {
    print('buildfunction ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),


      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (cotext,index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                 updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/${locations[index].flag}'
                  ),
                ),
              ),
            ),
          );
        }
          ),


    );
  }
}
