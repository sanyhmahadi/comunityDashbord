import 'dart:async';
import 'package:earthquake_app/earthquake_app/model/earthQuake_model.dart';
import 'package:earthquake_app/earthquake_app/network/network.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EarthQuakeApp extends StatefulWidget {
  @override
  _EarthQuakeAppState createState() => _EarthQuakeAppState();
}

class _EarthQuakeAppState extends State<EarthQuakeApp> {
  Future<EarthQuake> _earthQuakeData;
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markerList = <Marker>[];
  double zoomVlaue = 5.0;

  @override
  void initState() {
    super.initState();
    _earthQuakeData = Network().getAllEarthQuake();
    // _earthQuakeData.then(
    //     (values) => {print("Place: ${values.features[0].properties.place}")});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _builGoogleMap(context),
          _zoomPluse(),
          _zoomMinus(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          findQuakes();
        },
        label: Text("Find EarthQuakes"),
      ),
    );
  }

  _builGoogleMap(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition:
              CameraPosition(target: LatLng(31.7134184, 120.2599098), zoom: 3),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(_markerList),
        ));
  }

  Widget _zoomPluse() {
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {
            zoomVlaue++;
            _plus(zoomVlaue);
          },
          icon: Icon(
            FontAwesomeIcons.searchPlus,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Future<void> _plus(double zoomVlaue) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: (LatLng(31.7134184, 120.2599098)), zoom: zoomVlaue)));
  }

  Widget _zoomMinus() {
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () {
            zoomVlaue--;
            _minus(zoomVlaue);
          },
          icon: Icon(
            FontAwesomeIcons.searchMinus,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Future<void> _minus(double zoomVlaue) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: (LatLng(31.7134184, 120.2599098)), zoom: zoomVlaue)));
  }

  void findQuakes() {
    setState(() {
      _markerList.clear();
      _handleResponse();
    });
  }

  void _handleResponse() {
    setState(() {
      // ignore: non_constant_identifier_names
      _earthQuakeData.then((EarthQuake) => {
            // ignore: non_constant_identifier_names
            EarthQuake.features.forEach((EarthQuake) => {
                  _markerList.add(Marker(
                      markerId: MarkerId(EarthQuake.id),
                      infoWindow: InfoWindow(
                          title: EarthQuake.properties.mag.toString(),
                          snippet: EarthQuake.properties.title),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueBlue),
                      position: LatLng(EarthQuake.geometry.coordinates[1],
                          EarthQuake.geometry.coordinates[0]),
                      onTap: () {}))
                })
          });
    });
  }
}
