import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_movie/models/actors.dart';
import 'package:flutter_movie/services/file_service.dart';

class ActorModalForm extends StatefulWidget{
  final Actor actor;

  const ActorModalForm({super.key, required this.actor});
  @override
  State<ActorModalForm> createState() {
    return  ActorModalFormHome(actor: actor);
  }

} 


class ActorModalFormHome extends State<ActorModalForm> {
  final Actor actor;
  late Future<String> image;
  FileService fileService = FileService();

  ActorModalFormHome({required this.actor});

  @override
  void initState() {
    super.initState();
    image = fileService.read(actor.image);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<String?>(
              future: image,
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey,
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {

                  Uint8List bytes = base64Decode(snapshot.data!);
                  return CircleAvatar(
                    radius: 100,
                    backgroundImage: MemoryImage(bytes),
                  );
                } else {
                  return const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.error),
                  );
                }
              },
            ),
          const SizedBox(height: 10),
          const Text(
            'Актер',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 5),
          Text(
            actor.name,
            softWrap: true,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Роль: ${actor.role}',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Возраст: ${actor.age}',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Фильмы:',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          actor.movies.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: actor.movies.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 30,
                          child: Text(
                            actor.movies[index],
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ],
                )
              : const Text('Нет информации'),
          const SizedBox(height: 20),
          const Text(
            'Награды:',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          actor.awards.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: actor.awards.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 30,
                          child: Text(
                            actor.awards[index],
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ],
                )
              : const Text('Нет информации'),
          const SizedBox(height: 5),
          const Text(
            'Биография:',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            actor.biography,
            style: const TextStyle(
               fontFamily: 'Roboto',
               fontSize: 16,
               fontWeight: FontWeight.w400 
            ),
          )
        ],
      ),
    );
  }
}
