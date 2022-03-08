import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sun_flare/presentation/home_store.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, required this.store}) : super(key: key);

  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => store.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container());
  }
}
