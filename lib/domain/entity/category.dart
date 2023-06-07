import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Category {
  final int id;
  final String name;
  final String imageUrl;

  Category(
      {
        required this.id,
        required this.name,
        required this.imageUrl,
      });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'imageUrl': this.imageUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}

