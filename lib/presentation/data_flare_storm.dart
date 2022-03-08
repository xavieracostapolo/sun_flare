import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sun_flare/presentation/home_store.dart';

class DataFlareStorm extends StatelessWidget {
  const DataFlareStorm({Key? key, required this.store}) : super(key: key);

  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (store.isLoading) {
        return Container();
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              'Last Solar Flare Date: ${store.solarActivities.lastFlare?.startTime}'),
          Text(
              'Last Geo Storm Date: ${store.solarActivities.lastStorm?.startTime}'),
        ],
      );
    });
  }
}
