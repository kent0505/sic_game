import 'package:flutter/material.dart';

import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';

class FieldButton1 extends StatelessWidget {
  const FieldButton1({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Button(
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            color: Color(0xff270B6A),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: SvgWidget(
              'assets/dice/d$id.svg',
              height: 29,
            ),
          ),
        ),
      ),
    );
  }
}
