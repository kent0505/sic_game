import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../bloc/game_bloc.dart';
import '../models/game.dart';
import 'chip_widget.dart';

class FieldButton6 extends StatelessWidget {
  const FieldButton6({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 2,
          right: 2,
        ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Dices(id: 6),
                    _Dices(id: 5),
                    _Dices(id: 4),
                    _Dices(id: 3),
                    _Dices(id: 2),
                    _Dices(id: 1),
                  ],
                ),
                ChipWidget(game: game),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Dices extends StatelessWidget {
  const _Dices({required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgWidget('assets/dice/d$id.svg', height: 14),
          SizedBox(height: 4),
          SvgWidget('assets/dice/d$id.svg', height: 14),
          SizedBox(height: 4),
          SvgWidget('assets/dice/d$id.svg', height: 14),
        ],
      ),
    );
  }
}
