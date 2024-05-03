import 'package:flutter/material.dart';
import 'package:flutter_movie/main.dart';
import 'package:flutter_movie/screens/directors_and_producers.dart';
import 'package:flutter_movie/screens/personalities.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            color: const Color.fromRGBO(58, 63, 71, 1.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Image.asset('lib/images/logo.png',
                    width: 100,
                    height: 100,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Movie App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Directors and Producers'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DirectorsProducersScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('TV Shows'),
            onTap: () {
              Navigator.pushNamed(context, '/tv_shows');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Personalities'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Personalities()));
            },
          ),
        ],
      ),
    );
  }
}