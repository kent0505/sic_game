import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../game/screens/game_screen.dart';
import '../../../core/widgets/internet_widget.dart';
import '../../settings/screens/rules_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: InternetWidget(
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeRules) return RulesScreen();
                if (state is HomeSettings) return SettingsScreen();
                return GameScreen();
              },
            ),
            HomeAppbar(),
          ],
        ),
      ),
    );
  }
}
