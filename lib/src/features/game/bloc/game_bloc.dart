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
  double coins = 100000;
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
  ) {
    int dice1 = _random.nextInt(5) + 1;
    int dice2 = _random.nextInt(5) + 1;
    int dice3 = _random.nextInt(5) + 1;

    // int totalDice = dice1 + dice2 + dice3;

    logger(dice1);
    logger(dice2);
    logger(dice3);

    int win = 0;

    // sort games
    List<Game> sortedGames =
        games.where((element) => element.chips.isNotEmpty).toList();
    logger(sortedGames.length);

    // for (Game game in sortedGames) {}

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
