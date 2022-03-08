import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sun_flare/presentation/home_store.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeStore store = HomeStore();

  @override
  void initState() {
    store.getSolarActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de ejemplo Mobx'),
        elevation: 0,
      ),
      body: SafeArea(child: _body()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => {store.getSolarActivities()},
      ),
    );
  }

  Widget _body() {
    return Observer(builder: (_) {
      if (store.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
