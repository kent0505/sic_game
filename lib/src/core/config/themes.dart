import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: false,
  fontFamily: 'w600',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff3E207F),
  dialogTheme: const DialogTheme(
    insetPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  ),
);
