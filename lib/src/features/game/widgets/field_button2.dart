import 'package:flutter/material.dart';

import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';

class FieldButton2 extends StatelessWidget {
  const FieldButton2({
    super.key,
    required this.id,
    required this.ids,
  });

  final int id;
  final List<int> ids;

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                ids.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: SvgWidget(
                      'assets/dice/d${ids[index]}.svg',
                      height: 24,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
