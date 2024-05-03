import 'package:flutter/material.dart';
import 'package:flutter_movie/components/app_bar.dart';
import 'package:flutter_movie/components/cinema_main_info.dart';
import 'package:flutter_movie/components/cinema_overview.dart';
import 'package:flutter_movie/components/nav_bar.dart';
import 'package:flutter_movie/components/video_player.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OwnAppBar(),
            SizedBox(
              width: width,
              height: height * 0.3,
              child: const VideoApp(),
            ),
            const SizedBox(height: 20),
            const CinemaMainInfo(),
            const CinemaOverview(),
            const SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: width * 0.5,
                        height: height * 0.2,
                        child: const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('lib/images/dicaprio.png'),
                        )
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: width * 0.5,
                        height: height * 0.1,
                        child: const Text(
                          'Leonardo DiCaprio',
                          style: TextStyle(
                            color: Color.fromARGB(255, 24, 24, 24),
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      SizedBox(
                        width: width * 0.5,
                        height: height * 0.2,
                        child: const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('lib/images/nolan.png'),
                        )
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: width * 0.5,
                        height: height * 0.1,
                        child: const Text(
                          'Christopher Nolan',
                          style: TextStyle(
                            color: Color.fromARGB(255, 24, 24, 24),
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        width: width * 0.5,
                        height: height * 0.2,
                        margin: const EdgeInsets.only(right: 20),
                        child: const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('lib/images/hardy.png'),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: width * 0.5,
                        height: height * 0.1,
                        child: const Text(
                          'Tom Hardy',
                          style: TextStyle(
                            color: Color.fromARGB(255, 24, 24, 24),
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
