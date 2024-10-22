import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Future futureFunction;
  final Widget child;

  const Loader({required this.futureFunction, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureFunction,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return child;
          }
        });
  }
}
