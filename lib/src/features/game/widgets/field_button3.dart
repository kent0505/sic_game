import 'package:flutter/material.dart';

import '../../../core/widgets/button.dart';

class FieldButton3 extends StatelessWidget {
  const FieldButton3({
    super.key,
    required this.id,
    required this.value,
    required this.wins,
  });

  final int id;
  final int value;
  final int wins;

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'w600',
                  ),
                ),
                Text(
                  '1 wins $wins',
                  style: TextStyle(
                    color: Color(0xff776B95),
                    fontSize: 10,
                    fontFamily: 'w600',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
