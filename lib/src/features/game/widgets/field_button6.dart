import 'package:flutter/material.dart';

import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';

class FieldButton6 extends StatelessWidget {
  const FieldButton6({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Button(
        onPressed: () {},
        child: Container(
          height: 100,
          margin: EdgeInsets.only(
            bottom: 2,
            right: 2,
          ),
          decoration: BoxDecoration(
            color: Color(0xff270B6A),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Dices(id: 6),
                SizedBox(width: 2),
                _Dices(id: 5),
                SizedBox(width: 2),
                _Dices(id: 4),
                SizedBox(width: 2),
                _Dices(id: 3),
                SizedBox(width: 2),
                _Dices(id: 2),
                SizedBox(width: 2),
                _Dices(id: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Dices extends StatelessWidget {
  const _Dices({required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgWidget('assets/dice/d$id.svg', height: 14),
        SizedBox(height: 4),
        SvgWidget('assets/dice/d$id.svg', height: 14),
        SizedBox(height: 4),
        SvgWidget('assets/dice/d$id.svg', height: 14),
      ],
    );
  }
}
