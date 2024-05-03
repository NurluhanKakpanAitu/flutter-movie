import 'package:flutter/material.dart';
import 'package:flutter_movie/components/nav_bar.dart';

class Personalities extends StatefulWidget {
  const Personalities({super.key});
  @override
  State<Personalities> createState() => _PersonalitiesPageState();
}


class _PersonalitiesPageState extends State<Personalities> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.15,
              color: const Color.fromRGBO(58, 63, 71, 1.0),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Color.fromRGBO(246, 247, 249, 1),
                          size: 40,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(left: (width * 0.27) - 10),
                      child: Image.asset('lib/images/logo.png'),
                    )
                  ],
                ),
              ),
            ),
            CastPage(),
          ],
        ),
      ),
    );
  }
}

class CastPage extends StatelessWidget {
  const CastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CastMember> castMembers = [
      CastMember(
        name: 'Leonardo DiCaprio',
        role: 'Cobb',
        originalImageAsset: 'lib/images/dicaprio.png',
        age: 47,
        dateOfBirth: 'November 11, 1974',
        sex: 'Male',
      ),
      CastMember(
        name: 'Tom Berenger',
        role: 'Browning',
        originalImageAsset: 'lib/images/berenger.png',
        age: 72,
        dateOfBirth: 'May 31, 1949',
        sex: 'Male',
      ),
      CastMember(
        name: 'Ken Watanabe',
        role: 'Saito',
        originalImageAsset: 'lib/images/watanabe.png',
        age: 62,
        dateOfBirth: 'October 21, 1959',
        sex: 'Male',
      ),
      CastMember(
        name: 'Cillian Murphy',
        role: 'Robert Fischer',
        originalImageAsset: 'lib/images/murphy.png',
        age: 45,
        dateOfBirth: 'May 25, 1976',
        sex: 'Male',
      ),
      CastMember(
        name: 'Joseph Gordon-Levitt',
        role: 'Arthur',
        originalImageAsset: 'lib/images/joseph.png',
        age: 40,
        dateOfBirth: 'February 17, 1981',
        sex: 'Male',
      ),
      CastMember(
        name: 'Dileep Rao',
        role: 'Yusuf',
        originalImageAsset: 'lib/images/Dileep.png',
        age: 47,
        dateOfBirth: 'July 29, 1974',
        sex: 'Male',
      ),
      CastMember(
        name: 'Marion Cotillard',
        role: 'Mal',
        originalImageAsset: 'lib/images/marion.png',
        age: 46,
        dateOfBirth: 'September 30, 1975',
        sex: 'Female',
      ),
      CastMember(
        name: 'Tom Hardy',
        role: 'Eames',
        originalImageAsset: 'lib/images/hardy.png',
        age: 44,
        dateOfBirth: 'September 15, 1977',
        sex: 'Male',
      ),
      CastMember(
        name: 'Michael Caine',
        role: 'Miles',
        originalImageAsset: 'lib/images/michael.png',
        age: 89,
        dateOfBirth: 'March 14, 1933',
        sex: 'Male',
      ),
      CastMember(
        name: 'Lukas Haas',
        role: 'Nash',
        originalImageAsset: 'lib/images/lukas.png',
        age: 45,
        dateOfBirth: 'April 16, 1976',
        sex: 'Male',
      ),
      CastMember(
        name: 'Elliot Page',
        role: 'Ariadne',
        originalImageAsset: 'lib/images/elliot.png',
        age: 35,
        dateOfBirth: 'February 21, 1987',
        sex: 'Non-binary',
      ),
      CastMember(
        name: 'Tomás Arana',
        role: 'Fischer\'s lawyer',
        originalImageAsset: 'lib/images/tomas.png',
        age: 69,
        dateOfBirth: 'April 3, 1955',
        sex: 'Male',
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: castMembers.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _showActorDetails(context, castMembers[index]);
          },
          child: CastMemberCard(castMember: castMembers[index]),
        );
      },
    );
  }

  void _showActorDetails(BuildContext context, CastMember castMember) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(castMember.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Age: ${castMember.age}'),
              Text('Date of Birth: ${castMember.dateOfBirth}'),
              Text('Sex: ${castMember.sex}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class CastMember {
  final String name;
  final String role;
  final String originalImageAsset;
  final int age;
  final String dateOfBirth;
  final String sex;

  CastMember({
    required this.name,
    required this.role,
    required this.originalImageAsset,
    required this.age,
    required this.dateOfBirth,
    required this.sex,
  });
}

class CastMemberCard extends StatelessWidget {
  final CastMember castMember;

  const CastMemberCard({Key? key, required this.castMember}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(castMember.originalImageAsset),
            ),
            const SizedBox(height: 8),
            Text(
              castMember.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              castMember.role,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
