import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latlong2/latlong.dart';
import 'package:sun_flare/presentation/data_flare_storm.dart';
import 'package:sun_flare/presentation/get_user_location.dart';
import 'package:sun_flare/presentation/home_store.dart';
import 'package:sun_flare/presentation/loading.dart';
import 'package:sun_flare/presentation/products.dart';
import 'package:sun_flare/presentation/sign_in_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeStore store = HomeStore();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    store.getSolarActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.maps_home_work)),
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('App de ejemplo'),
          ),
          body: TabBarView(
            children: [
              GetUserLocation(title: 'title'),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    children: [
                      Loading(store: store),
                      DataFlareStorm(store: store)
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () => {store.getSolarActivities()},
                      child: const Text('data')),
                  ElevatedButton(
                      onPressed: () => {signOutGoogle()},
                      child: const Text('logout'))
                ],
              ),
              const Products(),
              FlutterMap(
                options: MapOptions(
                  center: LatLng(6.148726, -75.621499),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    attributionBuilder: (_) {
                      return const Text("© OpenStreetMap contributors");
                    },
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(6.148726, -75.621499),
                        builder: (ctx) => Container(
                          child: const FlutterLogo(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Sign Out");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }
}
