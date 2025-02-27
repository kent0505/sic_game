import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../bloc/game_bloc.dart';

class DealWidget extends StatelessWidget {
  const DealWidget({super.key});

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
                BlocBuilder<GameBloc, GameState>(
                  builder: (context, state) {
                    return Text(
                      state is GamesLoaded ? state.amount.toString() : '0',
                      style: TextStyle(
                        color: Color(0xffE6BE4B),
                        fontSize: 40,
                        fontFamily: 'w600',
                      ),
                    );
                  },
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
                  BlocBuilder<GameBloc, GameState>(
                    builder: (context, state) {
                      final win = state is GamesLoaded ? state.win : 0;

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color:
                              win > 0 ? Color(0xff2EC42A) : Color(0xffD90A0A),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: SizedBox(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: Text(
                                win > 0 ? '+$win' : '$win',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontFamily: 'w600',
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              BlocBuilder<GameBloc, GameState>(
                builder: (context, state) {
                  if (state is GamesLoaded) {
                    return SizedBox(
                      height: 210,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/dice/${state.dice1}.png',
                                height: 100,
                              ),
                              SizedBox(width: 20),
                              Image.asset(
                                'assets/dice/${state.dice2}.png',
                                height: 100,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Image.asset(
                            'assets/dice/${state.dice3}.png',
                            height: 100,
                          ),
                        ],
                      ),
                    );
                  }

                  return SizedBox();
                },
              ),
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
