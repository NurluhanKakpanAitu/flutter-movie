import 'package:flutter/material.dart';
import 'package:flutter_movie/components/app_bar.dart';
import 'package:flutter_movie/components/nav_bar.dart';
import 'package:flutter_movie/components/stuff_card.dart';
import 'package:flutter_movie/models/stuff.dart';
import 'package:flutter_movie/services/stuff_service.dart'; // Ensure this path is correct for your project

class StuffScreen extends StatelessWidget {
  const StuffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StuffScreenHome(),
    );
  }
}

class StuffScreenHome extends StatefulWidget {
  const StuffScreenHome({super.key});

  @override
  SuffScreenHomeState createState() => SuffScreenHomeState();
}

class SuffScreenHomeState extends State<StuffScreenHome> {
  late Future<List<Stuff>> _stuff;
  StuffService _stuffService = StuffService();

  @override
  void initState() {
    super.initState();
    _stuff = _stuffService.getAllMembersOfStuff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        body: Container(
          child: Column(
            children: [
              const OwnAppBar(),
              FutureBuilder<List<Stuff>>(
                future: _stuff,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: snapshot.data!
                            .map((stuff) => StuffCard(stuff: stuff))
                            .toList(),
                      ),
                    );
                  } else {
                    return const Text('No stuff members found');
                  }
                },
              ),
            ],
          ),
        ));
  }
}
