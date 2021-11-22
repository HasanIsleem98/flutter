import 'package:flutter/material.dart';
import 'package:testflutter/screens/catefories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:testflutter/screens/category_trips_screen.dart';
import 'package:testflutter/screens/trip_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AR'), // English, no country code
      ],
     home:CategoryScreen(),
      routes: {
        '/category-tips':(ctx)=>  Category_trips_screen(),
        '/trip-detial-screen':(ctx)=> TripDetailScreen(),
      },
    );
  }
}

