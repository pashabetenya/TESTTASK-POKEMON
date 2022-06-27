class Pokemon {
  final List<Data> data;

  Pokemon({
    required this.data,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        data: List<Data>.from(
          json['pokemon'].map(
            // ignore: unnecessary_lambdas
            (x) => Data.fromJson(x),
          ),
        ),
      );
}

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
    return Data(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      type: json['type'].cast<String>(),
      height: json['height'],
      weight: json['weight'],
    );
  }
}
