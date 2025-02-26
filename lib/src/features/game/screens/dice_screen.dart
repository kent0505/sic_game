import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/svg_widget.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  final Random _random = Random();

  int amount1 = 1;
  int amount2 = 1;
  int amount3 = 1;
  int win = 0;

  @override
  void initState() {
    super.initState();
    amount1 = _random.nextInt(6) + 1;
    amount2 = _random.nextInt(6) + 1;
    amount3 = _random.nextInt(6) + 1;
    logger(amount1);
    logger(amount2);
    logger(amount3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgWidget(
            Assets.bg,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 12 + MediaQuery.of(context).viewPadding.top,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Bet:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'w600',
                  ),
                ),
                Text(
                  '20',
                  style: TextStyle(
                    color: Color(0xffE6BE4B),
                    fontSize: 40,
                    fontFamily: 'w600',
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: win > 0 ? Color(0xff2EC42A) : Color(0xffD90A0A),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text(
                            win > 0 ? '+$win' : '-$win',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'w600',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgWidget('assets/dice/dice$amount1.svg'),
                  SizedBox(width: 20),
                  SvgWidget('assets/dice/dice$amount2.svg'),
                ],
              ),
              SizedBox(height: 4),
              SvgWidget('assets/dice/dice$amount3.svg'),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MainButton(
                  title: 'BACK',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
