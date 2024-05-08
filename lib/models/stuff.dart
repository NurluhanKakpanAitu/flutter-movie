class Stuff {
  final String id;
  final String name;
  final String activity;
  final String image;
  final String? biograpthy;

  Stuff(this.id, this.name, this.activity, this.image, this.biograpthy);

  static Stuff fromJson(Map<String, dynamic> json) {
    return Stuff(
      json['id'],
      json['name'],
      json['activity'],
      json['image'],
      json['biograpthy']
    );
  }

  Object? toJson() {
    return {
      'id': id,
      'name': name,
      'activity': activity,
      'image': image,
      'biograpthy': biograpthy
    };
  }
}
