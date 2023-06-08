import 'package:json_annotation/json_annotation.dart';

part 'citchen_element.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CitchenElement {
  final int id;
  final String name;
  final int price;
  final int weight;
  final String description;
  final String? imageUrl;
  final List<String> tegs;


  CitchenElement(
      {
        required this.id,
        required this.name,
        required this.price,
        required this.weight,
        required this.description,
        required this.imageUrl,
        required this.tegs,
      });

  factory CitchenElement.fromJson(Map<String, dynamic> json) =>
      _$CitchenElementFromJson(json);

  Map<String, dynamic> toJson() => _$CitchenElementToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
      'weight': this.weight,
      'description': this.description,
      'imageUrl': this.imageUrl,
      'tegs': this.tegs,
    };
  }

  factory CitchenElement.fromMap(Map<String, dynamic> map) {
    return CitchenElement(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      weight: map['weight'] as int,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      tegs: map['tegs'] as List<String>,
    );
  }
}

