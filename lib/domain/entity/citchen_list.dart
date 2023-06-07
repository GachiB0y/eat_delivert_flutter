
import 'package:eat_delivery_flutter/domain/entity/category.dart';
import 'package:eat_delivery_flutter/domain/entity/citchen_element.dart';
import 'package:json_annotation/json_annotation.dart';

part 'citchen_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CitchenList {
  @JsonKey(name: "dishes")
  final List<CitchenElement>? dishes;

  CitchenList(
      {required this.dishes}
      );

  factory CitchenList.fromJson(Map<String, dynamic> json) =>
      _$CitchenListFromJson(json);

  Map<String, dynamic> toJson() => _$CitchenListToJson(this);
}
