part of 'game_bloc.dart';

@immutable
sealed class GameState {}

final class GameInitial extends GameState {}

final class GamesLoaded extends GameState {
  GamesLoaded({
    required this.games,
    required this.chip,
    required this.coins,
  });

  final List<Game> games;
  final ChipModel chip;
  final double coins;
}

final class GameNoCoins extends GameState {}

final class GameDice extends GameState {
  GameDice({
    required this.dice1,
    required this.dice2,
    required this.dice3,
  });

  final int dice1, dice2, dice3;
}
