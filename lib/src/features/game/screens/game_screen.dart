import 'package:flutter/material.dart';

import '../../../core/widgets/button.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 124),
        Button(
          onPressed: () {},
          child: Text('GAME'),
        ),
      ],
    );
  }
}
