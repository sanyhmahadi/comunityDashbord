import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMap extends StatefulWidget {
  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  GoogleMapController mapController;
  static LatLng _shukraBad =
      const LatLng(23.474785371362803, 91.18176470039836);
  // static LatLng _geniousColony =
  //     const LatLng(23.471557526926567, 91.1820651077888);

  void onMapController(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        centerTitle: true,
      ),
      body: GoogleMap(
        markers: {shukrabadMap},
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(target: _shukraBad, zoom: 15.0),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goGeniousColony,
        label: Text("Genious Colony"),
        icon: Icon(Icons.place),
      ),
    );
  }

  static final CameraPosition geniousColonyHome = CameraPosition(
      target: LatLng(23.471557526926567, 91.1820651077888),
      bearing: 191.789,
      tilt: 34.89,
      zoom: 14.780);

  Future<void> _goGeniousColony() async {
    // ignore: await_only_futures
    final GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(geniousColonyHome));
  }

  Marker shukrabadMap = Marker(
    markerId: MarkerId("Shukrabad"),
    position: _shukraBad,
    infoWindow: InfoWindow(
        title: "Shukrabad", //marker er title
        snippet:
            "Very Clamzy Area" //this will add a subtext when we tap on marker
        ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  );
  // Marker geniousColony = Marker(
  //   markerId: MarkerId("Genious Colony"),
  //   position: _geniousColony,
  //   infoWindow: InfoWindow(
  //       title: "Genious Colony", //marker er title
  //       snippet:
  //           "Genious Colony House" //this will add a subtext when we tap on marker
  //       ),
  //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
  // );
}
