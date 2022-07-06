import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailScreen extends StatefulWidget {
  final String name, icao, city, state, country, tz, lat, lon;

  DetailScreen(this.name, this.icao, this.city, this.state, this.country,
      this.tz, this.lat, this.lon);
  // const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double lati = 0.0;
  double long = 0.0;

  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
          Marker(markerId: MarkerId('id-1'), position: LatLng(lati, long)));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    lati = double.parse(widget.lat.toString());

    long = double.parse(widget.lon.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Screen"),
      ),

      // body:

      //  Card(
      //     child: Column(
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Text(widget.name.toString()),
      //         Text(widget.icao.toString())
      //       ],
      //     ),
      //     Text(widget.city.toString() + " , " + widget.state.toString()),
      //     Text(widget.country.toString()),
      //     Text(widget.tz.toString()),
      //     GoogleMap(
      //       onMapCreated: _onMapCreated,
      //       markers: _markers,
      //       initialCameraPosition:
      //           CameraPosition(target: LatLng(25.56471, 83.977748), zoom: 15),
      //     ),
      //   ],
      // )),
      body: Column(
        children: [
          Container(
            height: 200,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              markers: _markers,
              initialCameraPosition:
                  CameraPosition(target: LatLng(lati, long), zoom: 15),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  widget.name.toString(),
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  widget.icao.toString(),
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 220),
            child: Card(
              elevation: 5,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.city.toString() + " , " + widget.state.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.country.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.tz.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
