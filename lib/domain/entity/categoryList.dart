
import 'package:eat_delivery_flutter/domain/entity/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categoryList.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoryList {
  @JsonKey(name: "сategories")
  final List<Category>? category;

  CategoryList(
  {required this.category}
      );

  factory CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}
