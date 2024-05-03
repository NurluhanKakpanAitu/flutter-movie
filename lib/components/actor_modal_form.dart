import 'package:flutter/material.dart';
import 'package:flutter_movie/components/carousel.dart';
import 'package:flutter_movie/models/actors.dart';

class ActorModalForm extends StatelessWidget {
  final Actor actor;
  const ActorModalForm({super.key, required this.actor});
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
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage(actor.image),
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
            'Фото:',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          ImageCarousel(
            items: actor.imagesFromMovie,
            height: 200,
          )
        ],
      ),
    );
  }
}
