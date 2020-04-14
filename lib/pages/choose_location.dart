import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_location.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Sydney',flag: 'assets/australia.png',url: 'Australia/Sydney'),
    WorldTime(location: 'London',flag: 'assets/uk.png',url: 'Europe/London'),
    WorldTime(location: 'Jabalpur', flag: 'assets/india.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'New York',flag: 'assets/usa.png',url: 'America/New_York'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Choose a Location', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
        child: Icon(
          Icons.add,
        ),
        ),     
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(locations[index].location);
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                backgroundImage  :  AssetImage('${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}