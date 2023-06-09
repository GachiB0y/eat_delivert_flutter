import 'dart:convert';

import 'package:eat_delivery_flutter/domain/api_client/api_client_category.dart';
import 'package:eat_delivery_flutter/domain/api_client/api_client_dishes.dart';
import 'package:eat_delivery_flutter/domain/entity/category.dart';
import 'package:eat_delivery_flutter/domain/entity/citchen_element.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DishesViewState {
  List<CitchenElement> _listItems = [];
  List<CitchenElement> get itemsGet => _listItems;
  set itemSet(CitchenElement val) => _listItems.add(val);

  DishesViewState({
    required List<CitchenElement> listItems,
  }) : _listItems = listItems;

  DishesViewState copyWith({
    List<CitchenElement>? listItems,
  }) {
    return DishesViewState(
      listItems: listItems ?? this._listItems,
    );
  }
}

class DishesViewCubit extends Cubit<DishesViewState> {
  final apiClient = CitchenListService();
  DishesViewCubit() : super(DishesViewState(listItems: [])) {
    loadDishes();
  }


  void loadDishes() async{
    final res = await apiClient.fetchCitchenList();
    if(res.dishes == null) return;
    final newState = state.copyWith(listItems: res.dishes );
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

  void incrementDishes(int idDishes) {
    final List<CitchenElement> dishes = state.itemsGet;
    for (var element in dishes){
      if (element.id == idDishes)
      {
        if (element.count >= 0) {
          element.count ++;
          final newState = state.copyWith(listItems: dishes);
          emit(newState);
        }
      }
    }
  }

  void decrementDishes(int idDishes) {
    final List<CitchenElement> dishes = state.itemsGet;
    for (var element in dishes){
      if (element.id == idDishes)
      {
        if (element.count > 0){
          element.count --;
          final newState = state.copyWith(listItems: dishes );
          emit(newState);
        }

      }
    }
  }

  int allPrice() {
    int allPrice= 0;
    final List<CitchenElement> dishes = state.itemsGet;
    for (var element in dishes){
      int priceElement = element.price * element.count;
      allPrice += priceElement;
    }
    return allPrice;
  }
}
