import 'package:flutter/material.dart';

class TermsText extends StatelessWidget {
  const TermsText(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'w300',
        height: 1.5,
      ),
    );
  }
}
