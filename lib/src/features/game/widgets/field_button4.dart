import 'package:flutter/material.dart';

import '../../../core/widgets/button.dart';

class FieldButton4 extends StatelessWidget {
  const FieldButton4({
    super.key,
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {},
      minSize: 70,
      child: Container(
        height: 70,
        margin: EdgeInsets.only(bottom: 2),
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Color(0xff270B6A),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff776B95),
              fontSize: 10,
              fontFamily: 'w600',
            ),
          ),
        ),
      ),
    );
  }
}
