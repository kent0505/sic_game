import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../bloc/home_bloc.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({super.key});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  bool menu = false;

  void onMenu() {
    setState(() {
      menu = !menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (menu)
            GestureDetector(
              onTap: onMenu,
              child: Container(
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
          Column(
            children: [
              SizedBox(
                height: 12 + MediaQuery.of(context).viewPadding.top,
              ),
              SizedBox(
                height: 42,
                width: 360,
                child: Stack(
                  children: [
                    Button(
                      onPressed: onMenu,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          SvgWidget(
                            Assets.appbar1,
                            width: 180,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              SvgWidget(menu ? Assets.close : Assets.home),
                              SizedBox(width: 12),
                              BlocBuilder<HomeBloc, HomeState>(
                                builder: (context, state) {
                                  return Text(
                                    menu
                                        ? 'Menu'
                                        : state is HomeInitial
                                            ? 'Sicbo'
                                            : state is HomeRules
                                                ? 'Rules'
                                                : 'Settings',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'w600',
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: SizedBox(
                        width: 200,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            SvgWidget(Assets.appbar2),
                            Row(
                              children: [
                                Spacer(),
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
                    ),
                  ],
                ),
              ),
              if (menu) ...[
                SizedBox(height: 10),
                Container(
                  height: 234,
                  width: 360,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xff3E207F),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff0F002F),
                        blurRadius: 14,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          _Button(
                            index: 1,
                            title: 'Sicbo Game',
                            asset: Assets.game,
                            active: state is HomeInitial,
                            onPressed: onMenu,
                          ),
                          SizedBox(height: 13),
                          _Button(
                            index: 2,
                            title: 'Game Rules',
                            asset: Assets.rules,
                            active: state is HomeRules,
                            onPressed: onMenu,
                          ),
                          SizedBox(height: 13),
                          _Button(
                            index: 3,
                            title: 'Settings',
                            asset: Assets.settings,
                            active: state is HomeSettings,
                            onPressed: onMenu,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.index,
    required this.title,
    required this.asset,
    required this.active,
    required this.onPressed,
  });

  final int index;
  final String title;
  final String asset;
  final bool active;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: active ? Color(0xff5D56F6) : Color(0xff270B6A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Button(
        onPressed: () {
          onPressed();
          context.read<HomeBloc>().add(ChangePage(index: index));
        },
        child: Row(
          children: [
            SizedBox(width: 16),
            SvgWidget(asset),
            SizedBox(width: 12),
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
