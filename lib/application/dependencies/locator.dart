import 'package:get_it/get_it.dart';
import 'package:sun_flare/data/repos/geo_storm_repo_impl.dart';
import 'package:sun_flare/data/repos/solar_flare_repo_impl.dart';
import 'package:sun_flare/data/services/nasa_service.dart';
import 'package:sun_flare/domain/repos/geo_storm_repo.dart';
import 'package:sun_flare/domain/repos/solar_flare_repo.dart';

final serviceLocator = GetIt.instance;

void setUp() {
  final NasaService _nasaService = NasaService();

  serviceLocator.registerLazySingleton<GeoStormRepo>(
      () => GeoStormRepoImpl(_nasaService));

  serviceLocator.registerLazySingleton<SolarFlareRepo>(
      () => SolarFlareRepoImpl(_nasaService));
}
