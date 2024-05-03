import 'package:flutter/material.dart';
import 'package:flutter_movie/components/actor_card.dart';
import 'package:flutter_movie/components/app_bar.dart';
import 'package:flutter_movie/components/cinema_main_info.dart';
import 'package:flutter_movie/components/cinema_overview.dart';
import 'package:flutter_movie/components/nav_bar.dart';
import 'package:flutter_movie/components/video_player.dart';
import 'package:flutter_movie/datas/cinema_list.dart';

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
                  for (final actor in actors.sublist(0, 2))
                    ActorCard(actor: actor)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
