import 'package:flutter/material.dart';
import 'package:flutter_movie/components/circular_avatar.dart';
import 'package:flutter_movie/models/stuff.dart';
import 'package:flutter_movie/services/file_service.dart';

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
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
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
            ],
          ),
        ],
      ),
    );
  }
}
