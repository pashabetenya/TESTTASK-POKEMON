import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'pokemon.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Data extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String img;

  @HiveField(3)
  final List<String> type;

  @HiveField(4)
  final String height;

  @HiveField(5)
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
