import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../bloc/game_bloc.dart';
import '../models/chip_model.dart';
import '../models/game.dart';

class GameButtons extends StatelessWidget {
  const GameButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(16),
      height: 120,
      child: Row(
        children: [
          _Button(clear: true),
          SizedBox(width: 8),
          _Button(clear: false),
          SizedBox(width: 8),
          _Deal(),
          SizedBox(width: 8),
          Button(
            onPressed: () {
              showDialog(
                context: context,
                barrierColor: Colors.transparent,
                builder: (context) {
                  return _ButtonsDialog();
                },
              );
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xffE6BE4B),
                borderRadius: BorderRadius.circular(10),
              ),
              child: BlocBuilder<GameBloc, GameState>(
                builder: (context, state) {
                  if (state is GamesLoaded) {
                    return SizedBox(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: SvgWidget(
                          state.chip.asset,
                          height: 32,
                        ),
                      ),
                    );
                  }

                  return SizedBox();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({required this.clear});

  final bool clear;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GamesLoaded) {
          final active = games.any(
            (element) => element.chips.isNotEmpty,
          );

          return Button(
            onPressed: active
                ? () {
                    context
                        .read<GameBloc>()
                        .add(clear ? ClearGame() : UndoGame());
                  }
                : null,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: active ? null : Color(0xff423368),
                border: Border.all(
                  width: 1,
                  color: active
                      ? clear
                          ? Color(0xffFF6D5E)
                          : Color(0xffFFA66E)
                      : Color(0xff414362),
                ),
                gradient: active
                    ? LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          clear ? Color(0xffFF4E3A) : Color(0xffFF9654),
                          clear ? Color(0xffF2240D) : Color(0xffFF751E),
                        ],
                      )
                    : null,
              ),
              child: SizedBox(
                height: 48,
                width: 68,
                child: Center(
                  child: Text(
                    clear ? 'Clear' : 'Undo',
                    style: TextStyle(
                      color: active ? Colors.white : Color(0xff776B95),
                      fontSize: 14,
                      fontFamily: 'w600',
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}

class _Deal extends StatelessWidget {
  const _Deal();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          if (state is GamesLoaded) {
            return Button(
              onPressed: state.active
                  ? () {
                      context.read<GameBloc>().add(DealGame());
                    }
                  : null,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: state.active ? null : Color(0xff423368),
                  border: Border.all(
                    width: 1,
                    color: state.active ? Color(0xff898BFF) : Color(0xff414362),
                  ),
                  gradient: state.active
                      ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff847EFF),
                            Color(0xff5D56F6),
                          ],
                        )
                      : null,
                ),
                child: SizedBox(
                  height: 48,
                  child: state.active
                      ? Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              'Deal',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'w600',
                              ),
                            ),
                            Spacer(),
                            Text(
                              state.amount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'w600',
                              ),
                            ),
                            SizedBox(width: 4),
                            SvgWidget(
                              Assets.coin,
                              height: 14,
                            ),
                            SizedBox(width: 10),
                          ],
                        )
                      : Center(
                          child: Text(
                            'Deal',
                            style: TextStyle(
                              color: Color(0xff776B95),
                              fontSize: 14,
                              fontFamily: 'w600',
                            ),
                          ),
                        ),
                ),
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}

class _ButtonsDialog extends StatelessWidget {
  const _ButtonsDialog();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 74,
        width: 360,
        margin: EdgeInsets.only(
          bottom: 110,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.42),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ChipWidget(
              chip: ChipModel(amount: 10000, asset: Assets.chip10000),
            ),
            _ChipWidget(
              chip: ChipModel(amount: 1000, asset: Assets.chip1000),
            ),
            _ChipWidget(
              chip: ChipModel(amount: 100, asset: Assets.chip100),
            ),
            _ChipWidget(
              chip: ChipModel(amount: 50, asset: Assets.chip50),
            ),
            _ChipWidget(
              chip: ChipModel(amount: 10, asset: Assets.chip10),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChipWidget extends StatelessWidget {
  const _ChipWidget({required this.chip});

  final ChipModel chip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Button(
        onPressed: () {
          Navigator.pop(context);
          context.read<GameBloc>().add(SelectChip(chip: chip));
        },
        child: SvgWidget(chip.asset),
      ),
    );
  }
}
