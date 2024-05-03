import 'package:flutter_movie/models/actors.dart';
import 'package:flutter_movie/models/cinema.dart';

final List<Cinema> cinemaList = [
  Cinema(
      name: 'Chaplin MEGA Silk Way',
      address: 'Астана, ТРЦ «MEGA Silk Way»\n (территория EXPO), 2-й этаж',
      phone: '87770760052',
      image: 'https://cdn.kino.kz/cinema/146/g800x534_8.jpg'),
  Cinema(
      name: 'Eurasia Cinema7',
      address: 'Астана, ул. Петрова, д.24, ТЦ "Евразия"',
      phone: '87761826768',
      image: 'https://cdn.kino.kz/cinema/146/g800x534_8.jpg'),
  Cinema(
      name: 'Kinopark 8 Keruen',
      address: 'Астана, ТРЦ "Керуен Сити", 4-й этаж',
      phone: '87770760052',
      image: 'https://cdn.kino.kz/cinema/146/g800x534_8.jpg'),
  Cinema(
      name: 'Kinopark 8 Moskva',
      address: 'Астана, ТРЦ "Москва", 3-й этаж',
      phone: '87770760052',
      image: 'https://cdn.kino.kz/cinema/146/g800x534_8.jpg'),
  Cinema(
      name: 'Kinopark 8 Saryarka',
      address: 'Астана, ТРЦ "Сарыарка", 3-й этаж',
      phone: '87770760052',
      image: 'https://cdn.kino.kz/cinema/146/g800x534_8.jpg'),
];

final List<Actor> actors = [
  Actor(
    name: 'Леонардо ДиКапРио',
    age: 46,
    image:
        'lib/images/dicaprio/dicaprio.png',
    dateOfBirth: '11.11.1974',
    role: 'Доминик Кобб',
    movies: ['Интерстеллар', 'Волк с Уолл-стрит', 'Остров проклятых'],
    awards: ['Оскар', 'Золотой глобус', 'Сатурн'],
    imagesFromMovie: [
      'lib/images/dicaprio/scene1.png',
      'lib/images/dicaprio/scene2.png',
      'lib/images/dicaprio/scene3.png',
    ],
  ),
  Actor(
      name: 'Джозеф Гордон-Левитт',
      age: 40,
      image:
          'lib/images/levitt/levitt.png',
      dateOfBirth: '17.02.1981',
      role: 'Артур',
      movies: [
        '500 дней лета',
        'Темный рыцарь',
        'Джонни Д'
      ],
      awards: [
        'Золотой глобус',
        'Сатурн'
      ],
      imagesFromMovie: [
        'lib/images/levitt/scene1.png',
        'lib/images/levitt/scene2.png',
        'lib/images/levitt/scene3.png'
      ])
];
