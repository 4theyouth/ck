class School {
  int id;
  String name;
  String type;

  School(this.id, this.name, this.type);

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
        json['id'] as int, json['name'] as String, json['type'] as String);
  }
}
