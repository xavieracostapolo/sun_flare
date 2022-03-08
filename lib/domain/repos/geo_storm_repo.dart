import 'package:flutter/material.dart';
import 'package:sun_flare/domain/entities/geo_storm.dart';

abstract class GeoStormRepo {
  Future<List<GeoStorm>> getStorms({
    required DateTime from,
    required DateTime to,
  });
}
