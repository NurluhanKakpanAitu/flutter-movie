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
      subtitle: Text(content),
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
      title: Text('Inseption News!'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

List<Map<String, String>> newsList = [
  {
    'title': 'Новость 1',
    'content': 'Краткое описание новости 1',
    'imageUrl':
        'https://th.bing.com/th/id/OIP.CjDJ_o3ly_egwYc3GCG3KwHaEK?rs=1&pid=ImgDetMain',
  },
  {
    'title': 'Новость 2',
    'content': 'Краткое описание новости 2',
    'imageUrl':
        'https://th.bing.com/th/id/OIP.CjDJ_o3ly_egwYc3GCG3KwHaEK?rs=1&pid=ImgDetMain',
  },
  {
    'title': 'Новость 3',
    'content': 'Краткое описание новости 3',
    'imageUrl':
        'https://th.bing.com/th/id/OIP.CjDJ_o3ly_egwYc3GCG3KwHaEK?rs=1&pid=ImgDetMain',
  },
];
