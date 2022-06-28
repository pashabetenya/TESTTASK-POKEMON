import 'package:json_annotation/json_annotation.dart';
part 'pokemon.g.dart';

@JsonSerializable()
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

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
