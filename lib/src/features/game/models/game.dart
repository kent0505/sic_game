import 'chip_model.dart';

class Game {
  Game({
    required this.id,
    required this.wins,
    this.total = 0,
    this.correct = const [],
  });

  final int id;
  final int wins;
  final int total;
  List<int> correct;
  List<ChipModel> chips = [];
}

List<Game> games = [
  Game(id: 1, wins: 2),
  Game(id: 2, wins: 2),
  Game(id: 3, wins: 2),
  Game(id: 4, wins: 2),
  Game(id: 5, wins: 2),
  Game(id: 6, wins: 2),
  Game(id: 7, wins: 6, correct: [2, 1]),
  Game(id: 8, wins: 6, correct: [3, 1]),
  Game(id: 9, wins: 6, correct: [4, 1]),
  Game(id: 10, wins: 6, correct: [5, 1]),
  Game(id: 11, wins: 6, correct: [6, 1]),
  Game(id: 12, wins: 6, correct: [3, 2]),
  Game(id: 13, wins: 6, correct: [4, 2]),
  Game(id: 14, wins: 6, correct: [5, 2]),
  Game(id: 15, wins: 6, correct: [6, 2]),
  Game(id: 16, wins: 6, correct: [4, 3]),
  Game(id: 17, wins: 6, correct: [5, 3]),
  Game(id: 18, wins: 6, correct: [6, 3]),
  Game(id: 19, wins: 6, correct: [5, 4]),
  Game(id: 20, wins: 6, correct: [6, 4]),
  Game(id: 21, wins: 6, correct: [6, 5]),
  Game(id: 22, wins: 62, total: 4),
  Game(id: 23, wins: 31, total: 5),
  Game(id: 24, wins: 18, total: 6),
  Game(id: 25, wins: 12, total: 7),
  Game(id: 26, wins: 8, total: 8),
  Game(id: 27, wins: 7, total: 9),
  Game(id: 28, wins: 6, total: 10),
  Game(id: 29, wins: 6, total: 11),
  Game(id: 30, wins: 7, total: 12),
  Game(id: 31, wins: 8, total: 13),
  Game(id: 32, wins: 12, total: 14),
  Game(id: 33, wins: 18, total: 15),
  Game(id: 34, wins: 31, total: 16),
  Game(id: 35, wins: 62, total: 17),
  Game(id: 36, wins: 2),
  Game(id: 37, wins: 2),
  Game(id: 38, wins: 11, correct: [1, 1]),
  Game(id: 39, wins: 11, correct: [2, 2]),
  Game(id: 40, wins: 11, correct: [3, 3]),
  Game(id: 41, wins: 11, correct: [4, 4]),
  Game(id: 42, wins: 11, correct: [5, 5]),
  Game(id: 43, wins: 11, correct: [6, 6]),
  Game(id: 44, wins: 180, correct: [3, 3, 3]),
  Game(id: 45, wins: 180, correct: [2, 2, 2]),
  Game(id: 46, wins: 180, correct: [1, 1, 1]),
  Game(id: 47, wins: 180, correct: [6, 6, 6]),
  Game(id: 48, wins: 180, correct: [5, 5, 5]),
  Game(id: 49, wins: 180, correct: [4, 4, 4]),
  Game(id: 50, wins: 31),
];
