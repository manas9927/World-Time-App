import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ?data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png' ;
    Color bgColor = data['isDaytime'] ? Colors.cyanAccent[100] : Colors.blueGrey[300] ;
    Color txtcolor = data['isDaytime'] ? Colors.black : Colors.white ;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 250.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: txtcolor,
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: txtcolor
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.0,),
              Image(
                image: AssetImage(data['flag']),
                height: 40.0,
              ),
              SizedBox(height: 15.0,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 20.0,
                  // fontWeight: FontWeight.bold,
                  color: txtcolor
                ),
              ),
              SizedBox(height: 220.0,),
              RaisedButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                     'time': result['time'],
                     'location': result['location'],
                     'isDaytime': result['isDaytime'],
                     'flag': result['flag'],
                   };
                  });
                  },
                icon: Icon(Icons.edit_location, color: Colors.white,),
                label: Text('Edit Location', style: TextStyle(color: Colors.white, fontSize: 16.0),),
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: bgColor
    );
  }
}