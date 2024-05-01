import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
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
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Movies'),
            onTap: () {
              Navigator.pushNamed(context, '/movies');
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
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
    );
  }
}