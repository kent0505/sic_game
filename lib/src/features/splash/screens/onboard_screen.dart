import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/main_button.dart';
import '../../home/screens/home_screen.dart';
import '../../../data/onboard_repository.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -132,
            left: 0,
            right: 0,
            child: RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                Assets.onboard,
                height: 572,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Sic Bo\nThrills!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontFamily: 'w700',
                  ),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Roll the dice, place your bets, and experience the excitement. Big wins are just a roll away!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'w300',
                  ),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MainButton(
                  title: 'Start',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return _Dialog();
                      },
                    );
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff1E1E1E).withValues(alpha: 0.95),
      child: SizedBox(
        height: 282,
        width: 270,
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              'Sic Bo Simulation',
              style: TextStyle(
                color: Color(0xffD90A0A),
                fontSize: 16,
                fontFamily: 'w600',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'This app is a digital imitation of the Sic Bo game and is for entertainment purposes only. Be cautious when playing real casino games, as they involve financial risk. We do not take any responsibility for real gambling outcomes or decisions. Play responsibly!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'w300',
                ),
              ),
            ),
            Spacer(),
            Button(
              onPressed: () {
                context.read<OnboardRepository>().removeOnboard();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                  (route) => false,
                );
              },
              child: Center(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Color(0xff0A84FF),
                    fontSize: 16,
                    fontFamily: 'w600',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
