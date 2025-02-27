import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/button.dart';
import '../bloc/game_bloc.dart';
import '../models/game.dart';
import 'chip_widget.dart';

class FieldButton4 extends StatelessWidget {
  const FieldButton4({
    super.key,
    required this.game,
    required this.small,
  });

  final Game game;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  child: Text(
                    small
                        ? 'Small are numbers 4 to 10 1 wins 1 Lose if any triple appears'
                        : 'Big are numbers 11 to 17 1 wins 1 Lose if any triple appears',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff776B95),
                      fontSize: 10,
                      fontFamily: 'w600',
                    ),
                  ),
                ),
              ),
              ChipWidget(game: game),
            ],
          ),
        ),
      ),
    );
  }
}
