import 'package:flutter/material.dart';

import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';

class FieldButton5 extends StatelessWidget {
  const FieldButton5({
    super.key,
    required this.id,
    required this.value,
  });

  final int id;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Button(
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.only(
            right: 2,
            bottom: 2,
          ),
          decoration: BoxDecoration(
            color: Color(0xff270B6A),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgWidget(
                  'assets/dice/d$value.svg',
                  height: 20,
                ),
                SizedBox(height: 4),
                SvgWidget(
                  'assets/dice/d$value.svg',
                  height: 20,
                ),
                SizedBox(height: 4),
                SvgWidget(
                  'assets/dice/d$value.svg',
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
