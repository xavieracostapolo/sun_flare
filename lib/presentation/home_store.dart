import 'package:mobx/mobx.dart';
import 'package:sun_flare/application/dependencies/locator.dart';
import 'package:sun_flare/domain/entities/solar_activities.dart';
import 'package:sun_flare/domain/repos/geo_storm_repo.dart';
import 'package:sun_flare/domain/repos/solar_flare_repo.dart';
import 'package:sun_flare/domain/use_case/solar_activities_usecase.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final SolarActivitiesUseCase _useCase = SolarActivitiesUseCase(
      serviceLocator.get<GeoStormRepo>(), serviceLocator.get<SolarFlareRepo>());

  @observable
  SolarActivities solarActivities = SolarActivities();

  @observable
  bool isLoading = false;

  @action
  Future<void> getSolarActivities() async {
    isLoading = true;
    solarActivities = await _useCase.getLastSolarActivities();
    isLoading = false;
  }
}
