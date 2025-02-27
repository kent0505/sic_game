part of 'game_bloc.dart';

@immutable
sealed class GameState {}

final class GameInitial extends GameState {}

final class GamesLoaded extends GameState {
  GamesLoaded({
    required this.chip,
    required this.coins,
    required this.amount,
    required this.active,
    this.dice1 = 1,
    this.dice2 = 1,
    this.dice3 = 1,
    this.win = 0,
  });

  final ChipModel chip;
  final int coins;
  final int amount;
  final bool active;
  final int dice1;
  final int dice2;
  final int dice3;
  final int win;
}

final class GameNoCoins extends GameState {}

final class GameDice extends GameState {}
