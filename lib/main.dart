import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spacex/locator.dart';
import 'package:spacex/theme_cubit.dart';
import 'package:spacex/viewmodels/spacex_view_model.dart';
import 'package:spacex/widget/spacex_app.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //tüm ağaca bu değeri verdik material app artık bu değeri biliyor
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, tema) {
        return MaterialApp(
          title: 'Space X',
          debugShowCheckedModeBanner: false,
          theme: tema,
          home: ChangeNotifierProvider<SpaceXViewModel>(
            create: (context) => locator<SpaceXViewModel>(),
            child: SpaceXApp(),
          ),
        );
      }),
    );
  }
}
