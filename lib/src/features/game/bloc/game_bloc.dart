import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/constants.dart';
import '../../../data/coin_repository.dart';
import '../models/chip_model.dart';
import '../models/game.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final CoinRepository _repository;
  ChipModel chip = ChipModel(amount: 10, asset: Assets.chip10);
  double coins = 100000;
  List<ChipModel> lastChips = [];

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
      games: games,
      chip: chip,
      coins: coins,
    ));
  }

  void _clearGame(
    ClearGame event,
    Emitter<GameState> emit,
  ) {
    for (Game game in games) {
      for (ChipModel ch in game.chips) {
        coins += ch.amount;
      }
    }
    for (Game game in games) {
      game.chips = [];
    }
    lastChips = [];
    emit(GamesLoaded(
      games: games,
      chip: chip,
      coins: coins,
    ));
  }

  void _undoGame(
    UndoGame event,
    Emitter<GameState> emit,
  ) {
    for (Game game in games) {
      for (ChipModel ch in game.chips) {
        if (ch.id == lastChips.last.id) {
          game.chips.remove(ch);
          lastChips.removeLast();
          emit(GamesLoaded(
            games: games,
            chip: chip,
            coins: coins,
          ));
          return;
        }
      }
    }
  }

  void _dealGame(
    DealGame event,
    Emitter<GameState> emit,
  ) {}

  void _selectChip(
    SelectChip event,
    Emitter<GameState> emit,
  ) {
    chip = event.chip;
    chip.id = lastChips.length;
    emit(GamesLoaded(
      games: games,
      chip: chip,
      coins: coins,
    ));
  }

  void _selectField(
    SelectField event,
    Emitter<GameState> emit,
  ) {
    if (coins > chip.amount) {
      for (Game game in games) {
        if (game.id == event.game.id) game.chips.add(chip);
      }
      coins -= chip.amount;
    } else {
      emit(GameNoCoins());
    }
    chip.id = lastChips.length + 1;
    lastChips.add(chip);
    emit(GamesLoaded(
      games: games,
      chip: chip,
      coins: coins,
    ));
  }
}
