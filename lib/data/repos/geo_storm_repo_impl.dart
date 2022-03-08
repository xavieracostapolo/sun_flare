import 'package:sun_flare/data/entities/geo_storm_dto.dart';
import 'package:sun_flare/data/services/nasa_service.dart';
import 'package:sun_flare/domain/entities/geo_storm.dart';
import 'package:sun_flare/domain/repos/geo_storm_repo.dart';

class GeoStormRepoImpl extends GeoStormRepo {
  final NasaService _nasaService;

  GeoStormRepoImpl(this._nasaService);

  @override
  Future<List<GeoStorm>> getStorms(
      {required DateTime from, required DateTime to}) async {
    final List<GeoStormDTO> res = await _nasaService.getGeoStorms(from, to);
    return res.map((e) => e.toModel()).toList();
  }
}
