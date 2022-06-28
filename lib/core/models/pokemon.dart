class Data {
  final int id;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;

  Data({
    required this.id,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final img = json['img'];
    final type = json['type'].cast<String>();
    final height = json['height'];
    final weight = json['weight'];

    return Data(
      id: id,
      name: name,
      img: img,
      type: type,
      height: height,
      weight: weight,
    );
  }
}
