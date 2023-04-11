import 'package:CTApp/components/HomeAppointmentListComponent.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.title});

  final String title;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool light = true;
  int _page = 0;

  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.people_outline_outlined,
    Icons.check_box_outline_blank,
    Icons.add,
  ];

  @override
  void initState() {
    FlutterStatusbarcolor.setStatusBarColor(const Color.fromARGB(255, 51, 62, 143));
    FlutterStatusbarcolor.setStatusBarWhiteForeground(
        useWhiteForeground(const Color.fromARGB(255, 51, 62, 143)));
    super.initState();
  }

  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String setNavText(int index) {
    if (index == 0) {
      return 'Home';
    }
    if (index == 1) {
      return 'Visits';
    }
    if (index == 2) {
      return 'Packages';
    }
    if (index == 3) {
      return 'More';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 245, 247, 1),
      body: SafeArea(
        child: PageView(
          controller: _controller,
          onPageChanged: (index) => setState(() {
            _page = index;
          }),
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 22.5,
                      bottom: 28,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 51, 62, 143),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              child: Text(
                                'Hola, Pedro Tavares',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Transform.scale(
                              scale: 0.75,
                              child: Switch(
                                value: light,
                                activeColor: Colors.green,
                                inactiveThumbColor: Colors.red,
                                inactiveTrackColor: Colors.red[200],
                                activeTrackColor: Colors.green[200],
                                trackOutlineColor:
                                    const MaterialStatePropertyAll<Color>(Colors.transparent),
                                onChanged: (bool value) {
                                  setState(() {
                                    light = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 100,
                            child: Material(
                              elevation: 5,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Ink.image(
                                height: 100,
                                image: const NetworkImage(
                                    'https://cdn2.melodijolola.com/media/files/styles/nota_imagen/public/field/image/banff-4331689_1920.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        right: size.width * 0.05,
                        left: size.width * 0.05,
                        top: 25,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            child: const Text(
                              'Próximas Citas',
                              style: TextStyle(
                                  color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          HomeAppointmentListComponent(
                            name: 'Pedro Tavares',
                            companyName: 'ISI Solutions',
                            dateTime: DateTime.now(),
                          ),
                          HomeAppointmentListComponent(
                            name: 'Luis Moncada',
                            companyName: 'Dappis',
                            dateTime: DateTime.now(),
                          ),
                          HomeAppointmentListComponent(
                            name: 'Gabriel López',
                            companyName: 'Pantech',
                            dateTime: DateTime.now().add(const Duration(days: 1)),
                          ),
                          HomeAppointmentListComponent(
                            name: 'Pedro Tavares',
                            companyName: 'ISI Solutions',
                            dateTime: DateTime.now().add(const Duration(days: 5)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.green,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.calendar_today_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        activeIndex: _page,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 25,
        rightCornerRadius: 25,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.blue : Colors.black;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  setNavText(index),
                  maxLines: 1,
                  style: TextStyle(color: color),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    Path path = Path();
    Offset of1 = Offset(size.width / 4, size.height * 0.75);
    Offset of2 = Offset(size.width / 2, size.height * 0.87);
    Offset of3 = Offset(size.width * 3 / 4, size.height);
    Offset of4 = Offset(size.width, size.height * 0.85);
    path.lineTo(0, size.height * 0.95);
    path.quadraticBezierTo(of1.dx, of1.dy, of2.dx, of2.dy);
    path.quadraticBezierTo(of3.dx, of3.dy, of4.dx, of4.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
