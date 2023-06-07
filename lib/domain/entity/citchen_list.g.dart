// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citchen_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitchenList _$CitchenListFromJson(Map<String, dynamic> json) => CitchenList(
      dishes: (json['dishes'] as List<dynamic>?)
          ?.map((e) => CitchenElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitchenListToJson(CitchenList instance) =>
    <String, dynamic>{
      'dishes': instance.dishes,
    };
