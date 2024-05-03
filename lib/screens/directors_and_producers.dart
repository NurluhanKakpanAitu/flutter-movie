import 'package:flutter/material.dart';
import 'package:flutter_movie/components/nav_bar.dart';

void main() {
  runApp(const DirectorsProducersScreen());
}

class DirectorsProducersScreen extends StatelessWidget {
  const DirectorsProducersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CrewMember> crewMembers = [
    CrewMember(
      name: 'Cristopher Nolan',
      role: 'Director',
      bio:
          'Best known for his cerebral, often nonlinear, storytelling, acclaimed Academy Award winner writer/director/producer Sir Christopher Nolan CBE was born in London, England. Over the course of more than 25 years of filmmaking, Nolan has gone from low-budget independent films to working on some of the biggest blockbusters ever made and became one of the most celebrated filmmakers of modern cinema.',
    ),
    CrewMember(
      name: 'Zakaria Alaoui',
      role: 'Production Manager',
      bio:
          'Zakaria Alaoui is known for Inception (2010), Godzilla and Kong (2024) and Black Widow (2021).',
    ),
    CrewMember(
      name: 'Chris Brigham',
      role: 'Production Manager',
      bio:
          'Chris Brigham is known for No Time To Die (2021), Argo (2012) and Начало (2010).',
    ),
    CrewMember(
      name: 'Emma Thomas',
      role: 'Producer',
      bio:
          'Dame Emma Thomas is an Academy Award Winner British film producer, known for co-producing films such as The Prestige (2006), Начало (2010) (2010), the Dark Knight trilogy (2005-2012), Interstellar (2014), Dunkirk (2017) and Oppenheimer (2023). She frequently collaborates with her husband, filmmaker Christopher Nolan.',
    ),
    CrewMember(
      name: 'Kanjirô Sakura',
      role: 'Writer',
      bio:
          'Chris Brigham is known for No Time To Die (2021), Argo (2012) and In (2010).Kanjirô Sakura was born in 1956 in Iwakuni, Yamaguchi, Japan. He is a producer and writer, known for Начало (2010), Васаби (2001) and Дорога в тысячу ли (2022).',
    ),
    CrewMember(
      name: 'Hans Zimmer',
      role: 'Composer',
      bio:
          'Hans Zimmer is a renowned German composer known for his powerful film scores that blend orchestral and electronic elements. Born on September 12, 1957, in Frankfurt, Germany, Zimmer has scored major films including "The Lion King," for which he won an Academy Award, and other hits like "Gladiator," "Inception," and "Interstellar." His work, characterized by its emotional depth, has earned him multiple prestigious awards and made him one of the most influential figures in film music today.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: const OwnAppBar(),
      ),
      drawer: const NavBar(),
      body: ListView.builder(
        itemCount: crewMembers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(crewMembers[index].name),
              subtitle: Text(crewMembers[index].role),
              isThreeLine: true,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Bio of ${crewMembers[index].name}'),
                    content: Text(crewMembers[index].bio),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CrewMember {
  final String name;
  final String role;
  final String bio;

  CrewMember({
    required this.name,
    required this.role,
    required this.bio,
  });
}

class OwnAppBar extends StatelessWidget {
  const OwnAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: MediaQuery.of(context).size.height * 0.15,
      color: const Color.fromRGBO(58, 63, 71, 1.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.menu, size: 30, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child:
                    Image.asset('lib/images/logo.png', width: 100, height: 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
