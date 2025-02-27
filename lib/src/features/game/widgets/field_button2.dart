import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../bloc/game_bloc.dart';
import '../models/game.dart';
import 'chip_widget.dart';

class FieldButton2 extends StatelessWidget {
  const FieldButton2({super.key, required this.game});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      game.correct.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 4,
                          ),
                          child: SvgWidget(
                            'assets/dice/d${game.correct[index]}.svg',
                            // height: 24,
                          ),
                        );
                      },
                    ),
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
