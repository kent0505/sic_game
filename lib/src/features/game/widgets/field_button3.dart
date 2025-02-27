import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/button.dart';
import '../bloc/game_bloc.dart';
import '../models/game.dart';
import 'chip_widget.dart';

class FieldButton3 extends StatelessWidget {
  const FieldButton3({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xff270B6A),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Button(
            onPressed: () {
              context.read<GameBloc>().add(SelectField(game: game));
            },
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        game.total.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'w600',
                        ),
                      ),
                      Text(
                        '1 wins ${game.wins}',
                        style: TextStyle(
                          color: Color(0xff776B95),
                          fontSize: 8,
                          fontFamily: 'w600',
                        ),
                      ),
                    ],
                  ),
                  ChipWidget(game: game),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
