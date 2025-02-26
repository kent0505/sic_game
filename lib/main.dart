import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/core/config/constants.dart';
import 'src/core/config/themes.dart';
import 'src/data/coin_repository.dart';
import 'src/data/onboard_repository.dart';
import 'src/features/game/bloc/game_bloc.dart';
import 'src/features/home/bloc/home_bloc.dart';
import 'src/features/splash/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<OnboardRepository>(
          create: (context) => OnboardRepositoryImpl(prefs: prefs),
        ),
        RepositoryProvider<CoinRepository>(
          create: (context) => CoinRepositoryImpl(prefs: prefs),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(
            create: (context) => GameBloc(
              repository: context.read<CoinRepository>(),
            )..add(InitGame()),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(Assets.onboard), context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: SplashScreen(),
    );
  }
}
