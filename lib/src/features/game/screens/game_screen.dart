import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game_bloc.dart';
import '../models/game.dart';
import '../widgets/deal_widget.dart';
import '../widgets/field_button1.dart';
import '../widgets/field_button2.dart';
import '../widgets/field_button3.dart';
import '../widgets/field_button4.dart';
import '../widgets/field_button5.dart';
import '../widgets/field_button6.dart';
import '../widgets/game_buttons.dart';
import '../widgets/no_money_dialog.dart';
import '../widgets/title_card.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 68 + MediaQuery.of(context).viewPadding.top,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocConsumer<GameBloc, GameState>(
              listener: (context, state) {
                if (state is GameNoCoins) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return NoMoneyDialog();
                    },
                  );
                }

                if (state is GameDice) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DealWidget();
                    },
                  ));
                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return DealWidget();
                  //   },
                  // );
                }
              },
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: TitleCard(
                            title: '1 wins 1 on one dice',
                            rotated: true,
                          ),
                        ),
                        Expanded(
                          child: TitleCard(
                            title: '1 wins 2 on two dices',
                            rotated: true,
                          ),
                        ),
                        Expanded(
                          child: TitleCard(
                            title: '1 wins 3 on three dices',
                            rotated: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      child: Column(
                        children: [
                          FieldButton1(game: games[0]),
                          FieldButton1(game: games[1]),
                          FieldButton1(game: games[2]),
                          FieldButton1(game: games[3]),
                          FieldButton1(game: games[4]),
                          FieldButton1(game: games[5]),
                        ],
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          TitleCard(title: '1 wins 6'),
                          FieldButton2(game: games[6]),
                          FieldButton2(game: games[7]),
                          FieldButton2(game: games[8]),
                          FieldButton2(game: games[9]),
                          FieldButton2(game: games[10]),
                          FieldButton2(game: games[11]),
                          FieldButton2(game: games[12]),
                          FieldButton2(game: games[13]),
                          FieldButton2(game: games[14]),
                          FieldButton2(game: games[15]),
                          FieldButton2(game: games[16]),
                          FieldButton2(game: games[17]),
                          FieldButton2(game: games[18]),
                          FieldButton2(game: games[19]),
                          FieldButton2(game: games[20]),
                        ],
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 44,
                            child: TitleCard(title: 'From 1\nto 62'),
                          ),
                          FieldButton3(game: games[21]),
                          FieldButton3(game: games[22]),
                          FieldButton3(game: games[23]),
                          FieldButton3(game: games[24]),
                          FieldButton3(game: games[25]),
                          FieldButton3(game: games[26]),
                          FieldButton3(game: games[27]),
                          FieldButton3(game: games[28]),
                          FieldButton3(game: games[29]),
                          FieldButton3(game: games[30]),
                          FieldButton3(game: games[31]),
                          FieldButton3(game: games[32]),
                          FieldButton3(game: games[33]),
                          FieldButton3(game: games[34]),
                        ],
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          FieldButton4(game: games[35], small: true),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      FieldButton2(game: games[37]),
                                      FieldButton2(game: games[38]),
                                      FieldButton2(game: games[39]),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 2),
                                TitleCard(
                                  title: 'Each double1 wins 11',
                                  rotated: true,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                FieldButton5(game: games[43], value: 3),
                                FieldButton5(game: games[44], value: 2),
                                FieldButton5(game: games[45], value: 1),
                                TitleCard(
                                  title: '1 wins 180',
                                  rotated: true,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                FieldButton6(game: games[49]),
                                TitleCard(
                                  title: '1 wins 31',
                                  rotated: true,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                FieldButton5(game: games[46], value: 6),
                                FieldButton5(game: games[47], value: 5),
                                FieldButton5(game: games[48], value: 4),
                                TitleCard(
                                  title: '1 wins 180',
                                  rotated: true,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      FieldButton2(game: games[40]),
                                      FieldButton2(game: games[41]),
                                      FieldButton2(game: games[42]),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 2),
                                TitleCard(
                                  title: 'Each double1 wins 11',
                                  rotated: true,
                                ),
                              ],
                            ),
                          ),
                          FieldButton4(game: games[36], small: false),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        GameButtons(),
      ],
    );
  }
}
