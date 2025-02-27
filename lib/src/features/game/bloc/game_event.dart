part of 'game_bloc.dart';

@immutable
sealed class GameEvent {}

final class InitGame extends GameEvent {}

final class ClearGame extends GameEvent {}

final class UndoGame extends GameEvent {}

final class DealGame extends GameEvent {}

final class SelectChip extends GameEvent {
  SelectChip({required this.chip});

  final ChipModel chip;
}

final class SelectField extends GameEvent {
  SelectField({required this.game});

  final Game game;
}

final class ClearData extends GameEvent {}
