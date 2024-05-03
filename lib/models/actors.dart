import 'package:flutter_movie/models/user.dart';

class Actor extends User{
  late String role;
  late List<String> movies; 
  late List<String> awards;
  late List<String> imagesFromMovie;

  Actor({
    required super.name,
    required super.age,
    required super.image,
    required super.dateOfBirth,
    required this.role,
    required this.movies,
    required this.awards,
    required this.imagesFromMovie
  });
}