import 'package:sun_flare/domain/entities/geo_storm.dart';
import 'package:sun_flare/domain/entities/solar_flare.dart';

class SolarActivities {
  final SolarFlare? lastFlare;
  final GeoStorm? lastStorm;

  SolarActivities({this.lastFlare, this.lastStorm});
}
