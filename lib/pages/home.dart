import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map ;
    print(data);


    String bgImage =data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data["isDaytime"] ? Colors.white : Colors.white;
   return Scaffold(
     backgroundColor:bgColor ,
      body: SafeArea(
        child: Container(
          decoration:  BoxDecoration(
            image : DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,

            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async{
                   dynamic result=await Navigator.pushNamed(context,'/location');
                   setState(() {
                     data ={
                       'time': result["time"],
                       'location':result['location'],
                     'isDaytime': result['isDaytime'],
                     'flag':result['flag'],
                     };

                   });
                  },
                  icon: Icon(
                      Icons.edit_location,

                  ),
                  label: Text(
                      'Edit Location',
                    style:TextStyle(

                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,


                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
