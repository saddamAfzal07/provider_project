import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_flutter/features/controller/counter.dart';
import 'package:provider_with_mvvm_flutter/features/controller/favorite.dart';
import 'package:provider_with_mvvm_flutter/features/controller/slider.dart';
import 'package:provider_with_mvvm_flutter/features/controller/themeChanger.dart';
import 'package:provider_with_mvvm_flutter/features/pages/counter.dart';
import 'package:provider_with_mvvm_flutter/features/pages/fav/favorite_app.dart';
import 'package:provider_with_mvvm_flutter/features/pages/slider_page.dart';
import 'package:provider_with_mvvm_flutter/features/pages/themechange.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Counter(),
        ),
        ChangeNotifierProvider(
          create: (_) => SliderClass(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppFavorite(),
        ),
      ],
      child: Builder(
        builder: ((context) {
          final state = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            themeMode: state.themeMode,
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue, brightness: Brightness.light),
            home: const Favouriteapp(),
            darkTheme: ThemeData(
                primarySwatch: Colors.blue, brightness: Brightness.dark),
          );
        }),
      ),
    );
  }
}
