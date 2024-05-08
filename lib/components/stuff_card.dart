import 'dart:convert';
import 'dart:typed_data';

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
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          OwnCircularAvatar(image: image),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
