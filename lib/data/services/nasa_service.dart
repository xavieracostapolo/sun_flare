import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:sun_flare/data/entities/geo_storm_dto.dart';
import 'package:sun_flare/data/entities/solar_flare_dto.dart';

class NasaService {
  static const _BASE_URL = 'https://kauai.ccmc.gsfc.nasa.gov';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<List<GeoStormDTO>> getGeoStorms(DateTime from, DateTime to) async {
    final response = await _dio.get(
      '/DONKI/WS/get/GST',
      queryParameters: {
        'startDate': DateFormat('yyyy-MM-dd').format(from),
        'endDate': DateFormat('yyyy-MM-dd').format(to)
      },
    );

    return (response.data as List).map((e) => GeoStormDTO.fromApi(e)).toList();
  }

  Future<List<SolarFlareDTO>> getFlares(DateTime from, DateTime to) async {
    final response = await _dio.get(
      '/DONKI/WS/get/FLR',
      queryParameters: {
        'startDate': DateFormat('yyyy-MM-dd').format(from),
        'endDate': DateFormat('yyyy-MM-dd').format(to)
      },
    );

    return (response.data as List)
        .map((e) => SolarFlareDTO.fromApi(e))
        .toList();
  }
}
