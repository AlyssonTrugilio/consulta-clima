import 'package:flutter/material.dart';

import '../domain/domain.dart';
import '../presentation/presentation.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather now',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.amber, brightness: Brightness.dark)),
      initialRoute: '/splash',
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case '/splash':
            return MaterialPageRoute(
              builder: (context) => const SplashPage(),
            );
          case '/':
            return MaterialPageRoute(
              builder: (context) => const SearchCityPage(),
            );
          case '/weather-detail':
            return MaterialPageRoute(
              builder: (context) => WeatherDetailPage(
                city: setting.arguments as CityEntity,
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}
