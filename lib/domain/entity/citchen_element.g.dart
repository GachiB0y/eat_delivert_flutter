// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citchen_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitchenElement _$CitchenElementFromJson(Map<String, dynamic> json) =>
    CitchenElement(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      weight: json['weight'] as int,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      tegs: (json['tegs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CitchenElementToJson(CitchenElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'weight': instance.weight,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'tegs': instance.tegs,
    };
