import 'dart:convert';
import 'package:earthquake_app/earthquake_app/model/earthQuake_model.dart';
import 'package:http/http.dart';

class Network {
  Future<EarthQuake> getAllEarthQuake() async {
    var apiUrl =
        "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";
    final response = await get(Uri.encodeFull(apiUrl));
    if (response.statusCode == 200) {
      print("Quake Data: ${response.body}");
      return EarthQuake.fromJson(json.decode(response.body));
    } else {
      throw Exception("Erron getting data from API");
    }
  }
}
