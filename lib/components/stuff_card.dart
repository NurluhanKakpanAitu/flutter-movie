import 'package:flutter/material.dart';
import 'package:flutter_movie/components/circular_avatar.dart';
import 'package:flutter_movie/models/stuff.dart';
import 'package:flutter_movie/screens/stuff_screen.dart';
import 'package:flutter_movie/services/file_service.dart';
import 'package:flutter_movie/services/stuff_service.dart';

class StuffCard extends StatefulWidget {
  final Stuff stuff;

  const StuffCard({super.key, required this.stuff});
  @override
  State<StatefulWidget> createState() {
    return _StuffCardState();
  }
}

class _StuffCardState extends State<StuffCard> {
  late Future<String> image;
  FileService fileService = FileService();
  StuffService stuffService = StuffService();

  @override
  void initState() {
    super.initState();
    image = fileService.read(widget.stuff.image);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      width: width * 0.9,
      height: height * 0.2,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(60, 187, 185, 185),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OwnCircularAvatar(image: image),
          const SizedBox(width: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.stuff.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.stuff.activity,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.05),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                    IconButton(
                      onPressed: () async {
                        await stuffService.deleteMemberOfStuff(widget.stuff.id);
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const StuffScreen(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
