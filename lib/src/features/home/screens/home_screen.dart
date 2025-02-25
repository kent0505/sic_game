import 'package:flutter/material.dart';

import '../../internet/widgets/internet_widget.dart';
import '../widgets/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: InternetWidget(
        child: Column(
          children: [
            Appbar(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
