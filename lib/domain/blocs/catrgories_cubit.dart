import 'dart:convert';

import 'package:eat_delivery_flutter/domain/api_client/api_client_category.dart';
import 'package:eat_delivery_flutter/domain/entity/category.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesViewState {
  List<Category> _listItems = [];
  List<Category> get itemsGet => _listItems;
  set itemSet(Category val) => _listItems.add(val);

  CategoriesViewState({
    required List<Category> listItems,
  }) : _listItems = listItems;

  CategoriesViewState copyWith({
    List<Category>? listItems,
  }) {
    return CategoriesViewState(
      listItems: listItems ?? this._listItems,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CategoriesViewState && runtimeType == other.runtimeType &&
              _listItems == other._listItems;

  @override
  int get hashCode => _listItems.hashCode;

  Map<String, dynamic> toMap() {
    return {
      '_listItems': this._listItems,
    };
  }

  factory CategoriesViewState.fromMap(Map<String, dynamic> map) {
    return CategoriesViewState(
      listItems: map['_listItems'] as List<Category>,
    );
  }

}

class CategoriesViewCubit extends Cubit<CategoriesViewState> {
  final apiClient = CategoryListService();
  CategoriesViewCubit() : super(CategoriesViewState(listItems: [])) {
    loadCategories();
  }


  void loadCategories() async{
    final res = await apiClient.fetchCategoryList();
    if(res.category == null) return;
    final newState = state.copyWith(listItems: res.category );
    emit(newState);
  }

  String changeString(String string) {
    var name = string;
    if(name.length > 16) {
      List<String> mylist = name.split(' ');
     return name = '${mylist[0]} \n${mylist[1]} ${mylist[2]}';
    }
    return name;
  }
}
