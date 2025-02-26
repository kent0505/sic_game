import 'package:flutter/material.dart';

import '../config/constants.dart';
import 'button.dart';
import 'svg_widget.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
      ),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            SizedBox(width: 16),
            Button(
              onPressed: () {
                Navigator.pop(context);
              },
              child: SvgWidget(Assets.back),
            ),
            SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'w600',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
