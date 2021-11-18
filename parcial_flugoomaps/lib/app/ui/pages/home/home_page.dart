import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';


class HomePage extends StatefulWidget {
 // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];

  @override
  void initState() {
    intilise();
    super.initState();
  }

  intilise(){
    Marker firstMarker = Marker(markerId: MarkerId('Zona Central I'), position: LatLng(13.6997322,-89.2003444), 
    infoWindow: InfoWindow(title: 'San Savador, Arce', snippet: 'calle que se ubica en el Centro de San Salvador'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed,));

    Marker SecondMarker = Marker(markerId: MarkerId('Zona Central I'), position: LatLng(13.7013266,-89.2244339), 
    infoWindow: InfoWindow(title: 'San Salvador, Salvador del mundo', snippet: ' Erigida en el año 1942. Alto pedestal Monumental'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue,));

    Marker ThirdMarker = Marker(markerId: MarkerId('Zona Central I'), position: LatLng(13.7048818,-89.1502548), 
    infoWindow: InfoWindow(title: 'Soyapango, Centro de Soyapango', snippet: 'Ciudad ubicado al centro del departamento y Área Metropolitana de San Salvador'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen,));

    Marker FourMarker = Marker(markerId: MarkerId('Zona Central I'), position: LatLng(13.6860845,-89.1894334), 
    infoWindow: InfoWindow(title: 'San Jacinto', snippet: 'suburbio, al este de San Salvador con altitud de 655 metros'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta,));

    markers.add(firstMarker);
    markers.add(SecondMarker);
    markers.add(ThirdMarker);
    markers.add(FourMarker);
    setState(() {
      
    });
  }
  

  /*final _controller = HomeController();
  Map<MarkerId, Marker> _makers = Map();*/
  //Set<Marker> _markers = {};

  /*void _onMapCreated(GoogleMapController){
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('id-1'), position: LatLng(13.7013318,-89.2266226),
        infoWindow: InfoWindow(title: 'San Salvador, Salvador del Mundo', 
        snippet: 'Rotonda Divino Salvador del Mundo'
        ),
        ),
      );
    });
  }*/
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          onTap: (latLang){
            //
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(target: LatLng (13.6860845,-89.1894334), zoom: 12),
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
          markers: markers.map((e)=> e).toSet(),
          ),
        ),
        ),
      );
      

    /*return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(target: LatLng(13.7013318,-89.2266226), zoom: 15),
      
      ),
      
    );*/
  }
}
