import 'package:blocauth/provider/books.dart';
import 'package:blocauth/provider/bookshelf.dart';
import 'package:blocauth/provider/categories.dart';
import 'package:blocauth/provider/internet_provider.dart';
import 'package:blocauth/provider/nyt.dart';

import 'package:blocauth/provider/sign_in_provider.dart';
import 'package:blocauth/screens/bookshelf_screen.dart';
import 'package:blocauth/screens/home_screen.dart';
import 'package:blocauth/screens/profile_screen.dart';
import 'package:blocauth/screens/search_screen.dart';
import 'package:blocauth/screens/specific_search_screen.dart';

import 'package:blocauth/screens/splash_screen.dart';
import 'package:blocauth/services/connectivity_service.dart';
import 'package:blocauth/services/connectivity_status.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  // initialize the application
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => SignInProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => InternetProvider()),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Books(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => NYT(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Bookshelf(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Categories(),
        ),
        StreamProvider<ConnectivityStatus>(
          create: (BuildContext context) =>
              ConnectivityService().connectionStatusController.stream,
        )
      ],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: {
          SearchScreen.routeName: (context) => SearchScreen(),
          BookShelfScreen.routeName: (context) => BookShelfScreen(),
          SpecificSearchScreen.routeName: (context) => SpecificSearchScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
        },
      ),
    );
  }
}
