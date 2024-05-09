import 'package:flutter/material.dart';
import 'package:flutter_movie/components/app_bar.dart';
import 'package:flutter_movie/components/circular_avatar.dart';
import 'package:flutter_movie/models/stuff.dart';
import 'package:flutter_movie/screens/stuff_screen.dart';
import 'package:flutter_movie/services/file_service.dart';

class StuffDetailsScreen extends StatelessWidget {
  final Stuff stuff;
  const StuffDetailsScreen({super.key, required this.stuff});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StuffDetailsScreenHome(stuff: stuff),
    );
  }
}

class StuffDetailsScreenHome extends StatefulWidget {
  final Stuff stuff;
  const StuffDetailsScreenHome({super.key, required this.stuff});

  @override
  State<StatefulWidget> createState() {
    return StuffDetailHomeState();
  }
}

class StuffDetailHomeState extends State<StuffDetailsScreenHome> {
  late Future<String> image;
  FileService fileService = FileService();

  @override
  void initState() {
    super.initState();
    image = fileService.read(widget.stuff.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const OwnAppBar(),
        const SizedBox(height: 20),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StuffScreen()));
              },
            ),
            const SizedBox(width: 90),
            const Text(
              'Stuff Details Screen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        OwnCircularAvatar(image: image),
        Text(widget.stuff.name),
        Text(widget.stuff.activity),
        Text(widget.stuff.biography!),
      ],
    ));
  }
}
