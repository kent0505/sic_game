import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  bool menu = false;

  void onMenu() {
    setState(() {
      menu = !menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12 + MediaQuery.of(context).viewPadding.top,
        ),
        Container(
          height: 42,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Button(
                onPressed: onMenu,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SvgWidget(
                        Assets.appbar1,
                        width: 180,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        SvgWidget(Assets.home),
                        SizedBox(width: 12),
                        Text(
                          'Sicbo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'w600',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SvgWidget(
                  Assets.appbar2,
                  width: 200,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    formatNumber(100000),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'w600',
                    ),
                  ),
                  SizedBox(width: 12),
                  SvgWidget(Assets.coin),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 234,
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xff3E207F),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              _Button(),
            ],
          ),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xff5D56F6),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
