import 'package:flutter/material.dart';
import 'package:flutter_movie/components/actor_modal_form.dart';
import 'package:flutter_movie/models/actors.dart';

class ActorCard extends StatelessWidget {
  final Actor actor;

  const ActorCard({super.key, required this.actor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          showDialog(
            context: context,
            builder: (context) => ActorModalForm(actor: actor),
          );
        },
        child: Column(
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
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
