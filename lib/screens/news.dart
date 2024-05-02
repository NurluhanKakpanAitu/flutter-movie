import 'package:flutter/material.dart';
import 'package:flutter_movie/components/nav_bar.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;

  const NewsTile(
      {super.key,
      required this.title,
      required this.content,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: const Text(""),
      leading: Image.network(imageUrl),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullNewsPage(
                title: title, content: content, imageUrl: imageUrl),
          ),
        );
      },
    );
  }
}

class FullNewsPage extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;

  const FullNewsPage(
      {required this.title, required this.content, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(content),
          ),
        ],
      ),
    );
  }
}

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: OwnAppBar(),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return NewsTile(
            title: newsList[index]['title'] ?? '',
            content: newsList[index]['content'] ?? '',
            imageUrl: newsList[index]['imageUrl'] ?? '',
          );
        },
      ),
    );
  }
}

class OwnAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Inseption News!'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

List<Map<String, String>> newsList = [
  {
    'title': '13 years later, director Nolan explains the ending of Inception',
    'content':
        "The famous American director Christopher Nolan, many years after the release of the film “Inception,” answered a question about its ending, Tengri Life reports with reference to the Men Today portal. If you watched the film Inception (2010), then you probably remember the ending of the film with the spinning top. In the story, the main character Cobb (Leonardo DiCaprio) was reunited with his family, however, it remained unclear whether this really happened in reality or in a dream. There have been debates for many years. According to the film's director, the film has an optimistic ending. “There is a nihilistic view of the ending, but at the same time the main character has decided to move on and live with his children. The ambiguity does not affect the emotional development of the character. This is more of an intellectual work for the audience,” the publication quotes Nolan as saying. ",
    'imageUrl':
        'https://tengrinews.kz/userdata/news/2023/news_503241/thumb_m/photo_435609.jpeg',
  },
  {
    'title': 'Who did Nolan portray as the main characters?',
    'content':
        'In his interview with Entertainment Weekly, Nolan explained the principle by which he formed the characters. He said that his team of heroes is a classic example of film production. Cobb is the director, Arthur is the producer, Ariadne is the production designer, Eames is the actor, Saito is the studio, and Fisher is the audience.',
    'imageUrl':
        'https://kinowar.com/wp-content/uploads/2020/04/%D0%94%D0%B8%D0%9A%D0%B0%D0%BF%D1%80%D0%B8%D0%BE-%D1%89%D1%83%D1%80%D0%B8%D1%82%D1%81%D1%8F-%D0%B2-%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B5.png',
  },
  {
    'title': 'Hidden meaning in names',
    'content':
        'If you take the capital letters of the main characters in English Dom, Robert, Eames, Arthur, Mal and Saito, you get the word "Dreams". And if you add Peter, Ariadne, and Yusuf, you get the word “Pay”. Taken together, this would most likely be better translated as “Dreams to order.” However, “buying dreams” also reflects the idea that Nolan wanted to show, referring to the occupation of the main characters.',
    'imageUrl':
        'https://kinowar.com/wp-content/uploads/2020/04/%D0%9B%D0%B5%D0%B2%D0%B8%D1%82%D1%82-%D0%A1%D1%86%D0%B5%D0%BD%D0%B0-%D0%B2-%D0%BA%D0%BE%D0%BC%D0%BD%D0%B0%D1%82%D0%B5.jpg',
  },
];
