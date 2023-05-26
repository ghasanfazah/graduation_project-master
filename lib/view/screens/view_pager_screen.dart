import 'dart:async';
import 'package:flutter/material.dart';
import 'package:marketing_graduation/core/constant/coloes.dart';
import 'package:marketing_graduation/data/datasorse/list_data_view_pager.dart';

class ViewPagerScreen extends StatefulWidget {
  const ViewPagerScreen({Key? key}) : super(key: key);

  @override
  State<ViewPagerScreen> createState() => _ViewPagerScreenState();
}

class _ViewPagerScreenState extends State<ViewPagerScreen> {
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentIndex < 2) _currentIndex++;

      _controller.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.decelerate,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Builder(
              builder: (ctx) => PageView(
                  controller: _controller,
                  onPageChanged: (val) {
                    setState(() {
                      _currentIndex = val;
                      if (_currentIndex == 2) {
                        Future.delayed(const Duration(seconds: 6), () {
                          Navigator.pushReplacementNamed(
                            ctx,
                            '/login_screen',
                          );
                        });
                      }
                    });
                  },
                  children: data.map((item) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item.assetImage,
                          width: 320,
                          height: 320,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'Cairo',
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          child: Text(
                            item.description,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              fontFamily: 'Cairo',
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  }).toList()),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  child: const Text(
                    'تخطي',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorApp.colorsRed,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Cairo',
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.83),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildContainer(
                      _currentIndex == 0 ? ColorApp.colorsRed : Colors.black38),
                  const SizedBox(width: 12),
                  buildContainer(
                      _currentIndex == 1 ? ColorApp.colorsRed : Colors.black38),
                  const SizedBox(
                    width: 12,
                  ),
                  buildContainer(
                      _currentIndex == 2 ? ColorApp.colorsRed : Colors.black38),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(Color color) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
