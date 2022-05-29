
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';


class Weather extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }


}
class _HomeState extends State<Weather>{
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  Future getWeather() async{
    http.Response response=await http.get("http://api.openweathermap.org/data/2.5/weather?q=Ja-ela&appid=717bc49fc1d9c03e85f08c1e362c2bf3");
    var results=jsonDecode(response.body);
    setState(() {
      this.temp=results['main']['temp'];
      this.description=results['weather'][0]['description'];
      this.currently=results['weather'][0]['main'];
      this.humidity=results['main']['humidity'];
      this.windSpeed=results['wind']['speed'];
    });
  }
  @override
  void initState(){
    super.initState();
    this.getWeather();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        backgroundColor: Colors.amberAccent,

      ),
      body: Column(
          children: <Widget>[
            Container(
              height:MediaQuery.of(context).size.height/3,
              width:MediaQuery.of(context).size.width,
              color:Colors.blue,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:EdgeInsets.only(bottom: 10.0),
                    child:Text(
                      "Currently in Ja-ela",
                      style:TextStyle(
                          color:Colors.white,
                          fontSize:14.0,
                          fontWeight:FontWeight.w600
                      ),
                    ),
                  ),
                  Text(
                    temp!=null? temp.toString()+"52\u0000":"Loading",
                    style:TextStyle(
                        color:Colors.white,
                        fontSize:40.0,
                        fontWeight:FontWeight.w600
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(bottom: 10.0),
                    child:Text(
                      currently!=null? currently.toString():"Loading",
                      style:TextStyle(
                          color:Colors.white,
                          fontSize:14.0,
                          fontWeight:FontWeight.w600
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                      title: Text("Temperture", style: TextStyle(fontFamily: 'Raleway-Italic'),),
                      trailing: Text( temp!=null? temp.toString()+"52\u0000":"Loading"),

                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.cloud),
                      title: Text("Weather"),
                      trailing: Text( description!=null? description.toString():"Loading"),

                    ),   ListTile(
                      leading: FaIcon(FontAwesomeIcons.sun),
                      title: Text("humidity"),
                      trailing: Text(humidity!=null? humidity.toString():"Loading"),

                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.wind),
                      title: Text("Wind Speed"),
                      trailing: Text(windSpeed!=null? windSpeed.toString():"Loading"),

                    ),

                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }


}

