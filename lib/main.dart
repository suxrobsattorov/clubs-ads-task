import 'package:find_sport_task/bloc/auth/sign_in/sign_in_bloc.dart';
import 'package:find_sport_task/view/screens/auth_screen.dart';
import 'package:find_sport_task/view/screens/clubs_ads_add_screen.dart';
import 'package:find_sport_task/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/sign_up/sign_up_bloc.dart';
import 'bloc/clubs_ads/clubs_ads_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider(
          create: (context) => ClubsAdsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Find Sport',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/splash',
        routes: {
          SplashScreen.name: (context) => const SplashScreen(),
          AuthScreen.name: (context) => const AuthScreen(),
          ClubsAdsAddScreen.name: (context) => const ClubsAdsAddScreen(),
        },
      ),
    );
  }
}
