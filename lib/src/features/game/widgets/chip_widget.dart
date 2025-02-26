import 'package:flutter/widgets.dart';

import '../../../core/widgets/svg_widget.dart';
import '../models/game.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: game.chips.isEmpty ? 0 : 1,
      child: game.chips.isEmpty
          ? null
          : SvgWidget(
              game.chips.last.asset,
              height: 32,
            ),
    );
  }
}
