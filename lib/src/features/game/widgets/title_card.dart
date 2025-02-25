import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    super.key,
    required this.title,
    this.rotated = false,
  });

  final String title;
  final bool rotated;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xff1B0159),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: RotatedBox(
          quarterTurns: rotated ? 1 : 0,
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
