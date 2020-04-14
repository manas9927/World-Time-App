import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingState extends StatefulWidget {
  @override
  _LoadingStateState createState() => _LoadingStateState();
}

class _LoadingStateState extends State<LoadingState> {


  void setupWorldTime() async {

    WorldTime instance =WorldTime(location: 'Jabalpur', flag: 'assets/india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }
  

  @override

  void initState(){
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SpinKitFoldingCube(
          size: 100.0,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.blueGrey : Colors.lightBlueAccent,
              ),
            );
          },
        ),
      )
    );
  }
}