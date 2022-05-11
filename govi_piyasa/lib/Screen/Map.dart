
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';

class Map2 extends StatefulWidget {
  String text;
  Map2({Key key,this.text}) : super(key: key);

  @override
  _Map2State createState() => _Map2State();
}

class _Map2State extends State<Map2> {
  GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Container(
          child:Column(
            children: [
              SearchMapPlaceWidget(
                placeType: PlaceType.address,
                placeholder: "${widget.text}",
                apiKey: 'AIzaSyDG9lYLOCWZ4cl_8UxWnhJYMYCl5W8xAdo',
                onSelected: (Place place) async {
                  Geolocation geolocation=await place.geolocation;
                  mapController.animateCamera(
                      CameraUpdate.newLatLng(geolocation.coordinates));
                  mapController.animateCamera(
                      CameraUpdate.newLatLngBounds(geolocation.bounds,0));
                },),

              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child:SizedBox(
                  height: 600.0,
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController googleMapController){
                      setState(() {
                        mapController=googleMapController;
                      });
                    },
                    initialCameraPosition: CameraPosition(
                        zoom: 15.0,
                        target: LatLng(21.1458,79.0082)
                    ),
                    mapType: MapType.satellite,
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }
}
