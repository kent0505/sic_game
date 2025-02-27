import 'dart:developer' as developer;

import 'package:intl/intl.dart';

import '../features/game/models/chip_model.dart';
import '../features/game/models/game.dart';

String formatNumber(int number) {
  return NumberFormat('#,###', "fr_FR").format(number);
}

void logger(Object message) {
  developer.log(message.toString());
}

int calculate1(Game game, int id, List<int> dices) {
  try {
    int x = 0;
    int y = 2;
    if (game.id == id && dices.contains(id)) {
      if (dices[0] == id && dices[1] == id) y = 3;
      if (dices[0] == id && dices[2] == id) y = 3;
      if (dices[1] == id && dices[2] == id) y = 3;
      if (dices[0] == id && dices[1] == id && dices[2] == id) y = 4;
      for (ChipModel ch in game.chips) {
        x += ch.amount;
      }
    }
    return x == 0 ? 0 : x * y;
  } catch (e) {
    logger(e);
    return 0;
  }
}

int calculate2(Game game, int id, List<int> dices) {
  try {
    int x = 0;
    if (game.id == id && game.correct.every((a) => dices.contains(a))) {
      for (ChipModel ch in game.chips) {
        x += ch.amount;
      }
    }
    return x == 0 ? 0 : x * game.wins;
  } catch (e) {
    logger(e);
    return 0;
  }
}

int calculate3(Game game, int id, total) {
  try {
    int x = 0;
    if (game.id == id && total == game.total) {
      for (ChipModel ch in game.chips) {
        x += ch.amount;
      }
    }
    return x == 0 ? 0 : x * game.wins;
  } catch (e) {
    logger(e);
    return 0;
  }
}

int calculate4(Game game, int id, List<int> dices) {
  try {
    int x = 0;
    dices.sort();
    List<int> sortedDices = List.from(dices)..sort();
    sortedDices.removeLast();
    if (game.id == id &&
        sortedDices[0] == game.correct[0] &&
        sortedDices[1] == game.correct[1]) {
      for (ChipModel ch in game.chips) {
        x += ch.amount;
      }
    }
    return x == 0 ? 0 : x * game.wins;
  } catch (e) {
    logger(e);
    return 0;
  }
}

int calculateSmall(Game game, int id, total) {
  try {
    int x = 0;
    if (game.id == id && total >= 4 && total <= 10) {
      for (ChipModel ch in game.chips) {
        x += ch.amount;
      }
    }
    return x == 0 ? 0 : x * game.wins;
  } catch (e) {
    logger(e);
    return 0;
  }
}

int calculateBig(Game game, int id, total) {
  try {
    int x = 0;
    if (game.id == id && total >= 11 && total <= 17) {
      for (ChipModel ch in game.chips) {
        x += ch.amount;
      }
    }
    return x == 0 ? 0 : x * game.wins;
  } catch (e) {
    logger(e);
    return 0;
  }
}

int calculate5(Game game, int id, List<int> dices) {
  try {
    int x = 0;
    if (game.id == id &&
        dices.toSet().containsAll(game.correct) &&
        game.correct.toSet().containsAll(dices)) {
      for (ChipModel ch in game.chips) {
        x += ch.amount;
      }
    }
    return x == 0 ? 0 : x * game.wins;
  } catch (e) {
    logger(e);
    return 0;
  }
}

int calculate6(Game game, List<int> dices) {
  try {
    int x = 0;
    final List<List<int>> validTriples = [
      [1, 1, 1],
      [2, 2, 2],
      [3, 3, 3],
      [4, 4, 4],
      [5, 5, 5],
      [6, 6, 6]
    ];
    if (game.id == 50 &&
        validTriples.any((triple) =>
            dices.length == triple.length &&
            dices.every((e) => triple.contains(e)))) {
      for (ChipModel ch in game.chips) {
        x += ch.amount;
      }
    }
    return x == 0 ? 0 : x * game.wins;
  } catch (e) {
    logger(e);
    return 0;
  }
}
