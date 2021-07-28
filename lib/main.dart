import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex/locator.dart';
import 'package:spacex/viewmodels/spacex_view_model.dart';
import 'package:spacex/widget/spacex_app.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ChangeNotifierProvider<SpaceXViewModel>(
          create: (context) => locator<SpaceXViewModel>(), child: SpaceXApp()),
    );
  }
}
