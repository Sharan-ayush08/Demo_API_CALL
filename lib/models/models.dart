import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Map<String, Post> postFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Post>(k, Post.fromJson(v)));

String postToJson(Map<String, Post> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Post {
  Post({
    required this.icao,
    required this.iata,
    required this.name,
    required this.city,
    required this.state,
    required this.country,
    required this.elevation,
    required this.lat,
    required this.lon,
    required this.tz,
  });

  String icao;
  String iata;
  String name;
  String city;
  String state;
  String country;
  int elevation;
  double lat;
  double lon;
  String tz;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        icao: json["icao"],
        iata: json["iata"] == null ? null : json["iata"],
        name: json["name"],
        city: json["city"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"],
        elevation: json["elevation"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        tz: json["tz"],
      );

  Map<String, dynamic> toJson() => {
        "icao": icao,
        "iata": iata == null ? null : iata,
        "name": name,
        "city": city,
        "state": state == null ? null : state,
        "country": country,
        "elevation": elevation,
        "lat": lat,
        "lon": lon,
        "tz": tz,
      };
}
