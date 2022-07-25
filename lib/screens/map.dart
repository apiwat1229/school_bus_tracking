// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_bus_tracking/widgets/drawer_menu.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

GoogleMapController? mapController;
Position? _userPositions;
String? lat, long;

void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}

class _MapPageState extends State<MapPage> {
  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    _userPositions = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = _userPositions?.latitude.toString();
    long = _userPositions?.longitude.toString();
    return _userPositions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ตำแหน่งปัจจุบันของรถ'),
        ),
        drawer: DrawerMenu(),
        body: FutureBuilder(
          future: _determinePosition(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              print('Lat : $lat , Long : $long');
              return GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                          _userPositions!.latitude, _userPositions!.longitude),
                      zoom: 15));
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[CircularProgressIndicator()],
                ),
              );
            }
          },
        ));
  }
}
