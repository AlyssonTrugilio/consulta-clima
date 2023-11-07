import 'package:consultar_clima/page/pag1.dart';
import 'package:consultar_clima/page/theme/temas.dart';
import 'package:flutter/material.dart';

final tema = ValueNotifier(ThemeMode.light);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: tema,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: value,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: lightColorScheme,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: darkColorScheme,
            ),
            home: Pag1(),
          );
        });
  }
}