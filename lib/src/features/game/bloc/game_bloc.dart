import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/constants.dart';
import '../../../core/utils.dart';
import '../../../data/coin_repository.dart';
import '../models/chip_model.dart';
import '../models/game.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final CoinRepository _repository;
  final Random _random = Random();

  ChipModel chip = ChipModel(amount: 10, asset: Assets.chip10);
  int coins = 100000;
  int amount = 0;
  List<ChipModel> lastChips = [];
  bool active = false;

  GameBloc({required CoinRepository repository})
      : _repository = repository,
        super(GameInitial()) {
    on<GameEvent>(
      (event, emit) => switch (event) {
        InitGame() => _initGame(event, emit),
        ClearGame() => _clearGame(event, emit),
        UndoGame() => _undoGame(event, emit),
        DealGame() => _dealGame(event, emit),
        SelectChip() => _selectChip(event, emit),
        SelectField() => _selectField(event, emit),
      },
    );
  }

  void _initGame(
    InitGame event,
    Emitter<GameState> emit,
  ) {
    coins = _repository.getCoins();
    emit(GamesLoaded(
      chip: chip,
      coins: coins,
      amount: amount,
      active: active,
    ));
  }

  void _clearGame(
    ClearGame event,
    Emitter<GameState> emit,
  ) {
    for (Game game in games) {
      game.chips = [];
    }
    coins += amount;
    lastChips = [];
    amount = 0;
    active = false;
    emit(GamesLoaded(
      chip: chip,
      coins: coins,
      amount: amount,
      active: active,
    ));
  }

  void _undoGame(
    UndoGame event,
    Emitter<GameState> emit,
  ) {
    for (Game game in games) {
      for (ChipModel ch in game.chips) {
        if (ch.id == lastChips.last.id) {
          coins += ch.amount;
          amount -= ch.amount;
          lastChips.removeLast();
          game.chips.remove(ch);
          active = games.any((element) => element.chips.isNotEmpty);
          emit(GamesLoaded(
            chip: chip,
            coins: coins,
            amount: amount,
            active: active,
          ));
          return;
        }
      }
    }
  }

  void _dealGame(
    DealGame event,
    Emitter<GameState> emit,
  ) async {
    if (coins < 0) {
      emit(GameNoCoins());
      emit(GamesLoaded(
        chip: chip,
        coins: coins,
        amount: amount,
        active: active,
      ));
      return;
    }
    int dice1 = _random.nextInt(6) + 1;
    int dice2 = _random.nextInt(6) + 1;
    int dice3 = _random.nextInt(6) + 1;

    int totalDice = dice1 + dice2 + dice3;

    List<int> dices = [dice1, dice2, dice3];

    int win = -amount;

    List<Game> sortedGames =
        games.where((element) => element.chips.isNotEmpty).toList();

    for (Game game in sortedGames) {
      win += calculate1(game, 1, dices);
      win += calculate1(game, 2, dices);
      win += calculate1(game, 3, dices);
      win += calculate1(game, 4, dices);
      win += calculate1(game, 5, dices);
      win += calculate1(game, 6, dices);

      win += calculate2(game, 7, dices);
      win += calculate2(game, 8, dices);
      win += calculate2(game, 9, dices);
      win += calculate2(game, 10, dices);
      win += calculate2(game, 11, dices);
      win += calculate2(game, 12, dices);
      win += calculate2(game, 13, dices);
      win += calculate2(game, 14, dices);
      win += calculate2(game, 15, dices);
      win += calculate2(game, 16, dices);
      win += calculate2(game, 17, dices);
      win += calculate2(game, 18, dices);
      win += calculate2(game, 19, dices);
      win += calculate2(game, 20, dices);
      win += calculate2(game, 21, dices);

      win += calculate3(game, 22, totalDice);
      win += calculate3(game, 23, totalDice);
      win += calculate3(game, 24, totalDice);
      win += calculate3(game, 25, totalDice);
      win += calculate3(game, 26, totalDice);
      win += calculate3(game, 27, totalDice);
      win += calculate3(game, 28, totalDice);
      win += calculate3(game, 29, totalDice);
      win += calculate3(game, 30, totalDice);
      win += calculate3(game, 31, totalDice);
      win += calculate3(game, 32, totalDice);
      win += calculate3(game, 33, totalDice);
      win += calculate3(game, 34, totalDice);
      win += calculate3(game, 35, totalDice);

      win += calculateSmall(game, 36, totalDice);
      win += calculateBig(game, 37, totalDice);

      win += calculate4(game, 38, dices);
      win += calculate4(game, 39, dices);
      win += calculate4(game, 40, dices);
      win += calculate4(game, 41, dices);
      win += calculate4(game, 42, dices);
      win += calculate4(game, 43, dices);

      win += calculate5(game, 44, dices);
      win += calculate5(game, 45, dices);
      win += calculate5(game, 46, dices);
      win += calculate5(game, 47, dices);
      win += calculate5(game, 48, dices);
      win += calculate5(game, 49, dices);

      win += calculate6(game, dices);
    }

    coins += win;
    await _repository.saveCoins(coins);
    coins = _repository.getCoins();

    emit(GameDice());
    emit(GamesLoaded(
      chip: chip,
      coins: coins,
      amount: amount,
      active: active,
      dice1: dice1,
      dice2: dice2,
      dice3: dice3,
      win: win,
    ));
  }

  void _selectChip(
    SelectChip event,
    Emitter<GameState> emit,
  ) {
    chip = event.chip;
    chip.id = lastChips.length;
    emit(GamesLoaded(
      chip: chip,
      coins: coins,
      amount: amount,
      active: active,
    ));
  }

  void _selectField(
    SelectField event,
    Emitter<GameState> emit,
  ) {
    if (coins > chip.amount) {
      for (Game game in games) {
        if (game.id == event.game.id) {
          final newChip = ChipModel(
            id: lastChips.length,
            amount: chip.amount,
            asset: chip.asset,
          );
          game.chips.add(newChip);
          lastChips.add(newChip);
          amount += chip.amount;
          coins -= chip.amount;
          break;
        }
      }
    } else {
      emit(GameNoCoins());
    }
    active = games.any((element) => element.chips.isNotEmpty);
    emit(GamesLoaded(
      chip: chip,
      coins: coins,
      amount: amount,
      active: active,
    ));
  }
}
