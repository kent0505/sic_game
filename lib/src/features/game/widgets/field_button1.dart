import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../bloc/game_bloc.dart';
import '../models/game.dart';
import 'chip_widget.dart';

class FieldButton1 extends StatelessWidget {
  const FieldButton1({super.key, required this.game});

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
                  SvgWidget(
                    'assets/dice/d${game.id}.svg',
                    height: 29,
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
