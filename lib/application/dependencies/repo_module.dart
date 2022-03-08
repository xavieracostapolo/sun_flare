/*
import 'package:sun_flare/data/repos/geo_storm_repo_impl.dart';
import 'package:sun_flare/data/repos/solar_flare_repo_impl.dart';
import 'package:sun_flare/data/services/nasa_service.dart';
import 'package:sun_flare/domain/repos/geo_storm_repo.dart';
import 'package:sun_flare/domain/repos/solar_flare_repo.dart';

class RepoModule {
  static GeoStormRepo _geoStormRepo;
  static SolarFlareRepo _solarFlareRepo;

  static NasaService _nasaService = NasaService();

  static GeoStormRepo geoStormRepo() {
    _geoStormRepo ??= GeoStormRepoImpl(_nasaService);
    return _geoStormRepo;
  }

  static SolarFlareRepo solarFlareRepo() {
    _solarFlareRepo ??= SolarFlareRepoImpl(_nasaService);
    return _solarFlareRepo;
  }
}
*/