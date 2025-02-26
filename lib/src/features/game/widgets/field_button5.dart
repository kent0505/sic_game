import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../bloc/game_bloc.dart';
import 'chip_widget.dart';

class FieldButton5 extends StatelessWidget {
  const FieldButton5({
    super.key,
    required this.index,
    required this.value,
  });

  final int index;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 2,
          bottom: 2,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xff270B6A),
            borderRadius: BorderRadius.circular(4),
          ),
          child: BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              if (state is GamesLoaded) {
                final game = state.games[index];

                return Button(
                  onPressed: () {
                    context.read<GameBloc>().add(SelectField(game: game));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgWidget('assets/dice/d$value.svg', height: 20),
                            SizedBox(height: 4),
                            SvgWidget('assets/dice/d$value.svg', height: 20),
                            SizedBox(height: 4),
                            SvgWidget('assets/dice/d$value.svg', height: 20),
                          ],
                        ),
                      ),
                      ChipWidget(game: game),
                    ],
                  ),
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
