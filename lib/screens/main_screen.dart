import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      drawer: NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.15,
              color: const Color.fromRGBO(58, 63, 71, 1.0),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Builder(builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu,
                          size: 30,
                          ),
                          color: Colors.white,
                        
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      }),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(left: (width * 0.27) - 10),
                      child: Image.asset('lib/images/logo.png'),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: height * 0.3,
              child: VideoApp(),
            ),
            Container(
              width: width,
              height: height * 0.1,
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Color.fromARGB(237, 85, 82, 82),
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '2010',
                          style: TextStyle(
                            color: Color.fromARGB(255, 55, 54, 54),
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined,
                            color: Color.fromARGB(237, 85, 82, 82), size: 30),
                        SizedBox(width: 10),
                        Text(
                          '2h 28m',
                          style: TextStyle(
                            color: Color.fromARGB(255, 24, 24, 24),
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        Icon(Icons.rate_review_sharp,
                            color: Color.fromARGB(237, 85, 82, 82), size: 30),
                        SizedBox(width: 10),
                        Text(
                          '8.8/10',
                          style: TextStyle(
                            color: Color.fromARGB(255, 24, 24, 24),
                            fontSize: 20,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: height * 0.1,
              alignment: Alignment.center,
              child: const Text(
                'Inception',
                style: TextStyle(
                    color: Color.fromARGB(255, 24, 24, 24),
                    fontSize: 30,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding:  EdgeInsets.only(left: 20, right: 20),
              child:  Text(
                "Cobb is a talented thief, the best of the best in the dangerous art of extraction: he steals valuable secrets from the depths of the subconscious during sleep, when the human mind is most vulnerable. Cobb's rare abilities made him a valuable player in the treacherous world of industrial espionage, but they also turned him into an eternal fugitive and deprived him of everything he had ever loved.",
                style: TextStyle(
                  color: Color.fromARGB(255, 24, 24, 24),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            const SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
<<<<<<< Updated upstream
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.5,
                          height: height * 0.3,
                          child: Image.asset('lib/images/dicaprio.png'),
=======
                  Column(
                    children: [
                      SizedBox(
                        width: width * 0.5,
                        height: height * 0.2,
                        child: const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('lib/images/dicaprio.png'),
                        ),
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
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
>>>>>>> Stashed changes
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
                  ),
                  const SizedBox(width: 20),
<<<<<<< Updated upstream
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.5,
                          height: height * 0.3,
                          child: Image.asset('lib/images/nolan.png'),
=======
                  Column(
                    children: [
                      SizedBox(
                        width: width * 0.5,
                        height: height * 0.2,
                        child: const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('lib/images/nolan.png'),
                        ),
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
>>>>>>> Stashed changes
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
                  ),
                  const SizedBox(width: 20),
<<<<<<< Updated upstream
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.5,
                          height: height * 0.3,
                          margin: const EdgeInsets.only(right: 20),
                          child: Image.asset('lib/images/hardy.png'),
=======
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
>>>>>>> Stashed changes
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
                    ),
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
