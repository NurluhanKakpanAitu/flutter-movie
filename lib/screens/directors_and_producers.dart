import 'package:flutter/material.dart';

class DirectorsProducersScreen extends StatelessWidget{
  const DirectorsProducersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }

}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Directors and Producers'),
      ),
      body: const Center(
        child: Text('Directors and Producers'),
      ),
    );
  }

}