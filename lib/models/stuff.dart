class Stuff{
  final String name;
  final String activity;
  final String image;
  final String? biograpthy;

  Stuff(this.name, this.activity, this.image, this.biograpthy);

  static Stuff fromJson(Map<String, dynamic> json) {
    return Stuff(
      json['name'],
      json['activity'],
      json['image'],
      json['biograpthy'],
    );
  }
}