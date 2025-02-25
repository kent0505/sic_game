import 'package:flutter/material.dart';
import 'package:sic_game/src/features/game/widgets/field_button3.dart';
import 'package:sic_game/src/features/game/widgets/field_button4.dart';
import 'package:sic_game/src/features/game/widgets/field_button5.dart';
import 'package:sic_game/src/features/game/widgets/field_button6.dart';

import '../widgets/field_button1.dart';
import '../widgets/field_button2.dart';
import '../widgets/title_card.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 68 + MediaQuery.of(context).viewPadding.top),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              SizedBox(
                height: 606,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 18,
                      child: Column(
                        children: [
                          TitleCard(
                            title: '1 wins 1 on one dice',
                            height: 200,
                            width: 18,
                            rotated: true,
                          ),
                          TitleCard(
                            title: '1 wins 2 on two dices',
                            height: 200,
                            width: 18,
                            rotated: true,
                          ),
                          TitleCard(
                            title: '1 wins 3 on three dices',
                            height: 200,
                            width: 18,
                            rotated: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 2),
                    SizedBox(
                      width: 50,
                      child: Column(
                        children: [
                          FieldButton1(id: 1),
                          FieldButton1(id: 2),
                          FieldButton1(id: 3),
                          FieldButton1(id: 4),
                          FieldButton1(id: 5),
                          FieldButton1(id: 6),
                        ],
                      ),
                    ),
                    SizedBox(width: 2),
                    SizedBox(
                      width: 104,
                      child: Column(
                        children: [
                          TitleCard(
                            title: '1 wins 6',
                            height: 20,
                            width: 104,
                          ),
                          FieldButton2(id: 1, ids: [2, 1]),
                          FieldButton2(id: 2, ids: [3, 1]),
                          FieldButton2(id: 3, ids: [4, 1]),
                          FieldButton2(id: 4, ids: [5, 1]),
                          FieldButton2(id: 5, ids: [6, 1]),
                          FieldButton2(id: 1, ids: [3, 2]),
                          FieldButton2(id: 2, ids: [4, 2]),
                          FieldButton2(id: 3, ids: [5, 2]),
                          FieldButton2(id: 4, ids: [6, 2]),
                          FieldButton2(id: 5, ids: [4, 3]),
                          FieldButton2(id: 1, ids: [5, 3]),
                          FieldButton2(id: 2, ids: [6, 3]),
                          FieldButton2(id: 3, ids: [5, 4]),
                          FieldButton2(id: 4, ids: [6, 4]),
                          FieldButton2(id: 5, ids: [6, 5]),
                        ],
                      ),
                    ),
                    SizedBox(width: 2),
                    SizedBox(
                      width: 60,
                      child: Column(
                        children: [
                          TitleCard(
                            title: 'From 1\nto 62',
                            height: 44,
                            width: 104,
                          ),
                          FieldButton3(id: 1, value: 4, wins: 62),
                          FieldButton3(id: 2, value: 5, wins: 31),
                          FieldButton3(id: 3, value: 6, wins: 18),
                          FieldButton3(id: 4, value: 7, wins: 12),
                          FieldButton3(id: 5, value: 8, wins: 8),
                          FieldButton3(id: 6, value: 9, wins: 7),
                          FieldButton3(id: 7, value: 10, wins: 6),
                          FieldButton3(id: 7, value: 11, wins: 6),
                          FieldButton3(id: 7, value: 12, wins: 7),
                          FieldButton3(id: 7, value: 13, wins: 8),
                          FieldButton3(id: 7, value: 14, wins: 12),
                          FieldButton3(id: 7, value: 15, wins: 18),
                          FieldButton3(id: 7, value: 16, wins: 31),
                          FieldButton3(id: 7, value: 17, wins: 62),
                        ],
                      ),
                    ),
                    SizedBox(width: 2),
                    SizedBox(
                      width: 126,
                      child: Column(
                        children: [
                          FieldButton4(
                            id: 1,
                            title:
                                'Small are numbers 4 to 10 1 wins 1 Lose if any triple appears',
                          ),
                          SizedBox(
                            height: 116,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 104,
                                  child: Column(
                                    children: [
                                      FieldButton2(id: 1, ids: [1, 1]),
                                      FieldButton2(id: 1, ids: [2, 2]),
                                      FieldButton2(id: 1, ids: [3, 3]),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 2),
                                TitleCard(
                                  title: 'Each double1 wins 11',
                                  height: 115,
                                  width: 20,
                                  rotated: true,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                FieldButton5(id: 1, value: 3),
                                FieldButton5(id: 1, value: 2),
                                FieldButton5(id: 1, value: 1),
                                TitleCard(
                                  title: '1 wins 180',
                                  height: 74,
                                  width: 20,
                                  rotated: true,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                FieldButton6(),
                                TitleCard(
                                  title: '1 wins 31',
                                  height: 76,
                                  width: 20,
                                  rotated: true,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                FieldButton5(id: 1, value: 6),
                                FieldButton5(id: 1, value: 5),
                                FieldButton5(id: 1, value: 4),
                                TitleCard(
                                  title: '1 wins 180',
                                  height: 74,
                                  width: 20,
                                  rotated: true,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 116,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 104,
                                  child: Column(
                                    children: [
                                      FieldButton2(id: 1, ids: [4, 4]),
                                      FieldButton2(id: 1, ids: [5, 5]),
                                      FieldButton2(id: 1, ids: [6, 6]),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 2),
                                TitleCard(
                                  title: 'Each double1 wins 11',
                                  height: 115,
                                  width: 20,
                                  rotated: true,
                                )
                              ],
                            ),
                          ),
                          FieldButton4(
                            id: 2,
                            title:
                                'Big are numbers 11 to 17 1 wins 1 Lose if any triple appears',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
