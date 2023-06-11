import 'package:eat_delivery_flutter/domain/api_client/api_client_dishes.dart';
import 'package:eat_delivery_flutter/ui/widget/citchen_widget.dart';
import 'package:eat_delivery_flutter/ui/widget/component/basket_widget.dart';
import 'package:eat_delivery_flutter/ui/widget/component/categories_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewState {
  final int selectedPageIndex;
  final List<Widget> pages;
  final bool isCategory;
final String? label;
  MainViewState({
    required this.selectedPageIndex,
    required this.pages,
    required this.isCategory,
    required this.label,
}){}
  MainViewState copyWith({
    int? selectedPageIndex,
    List<Widget>? pages,
    bool? isCategory,
    String? label,
  }) {
    return MainViewState(
      selectedPageIndex: selectedPageIndex ?? this.selectedPageIndex,
      pages: pages ?? this.pages,
      isCategory: isCategory ?? this.isCategory,
      label: label ?? this.label,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainViewState &&
          runtimeType == other.runtimeType &&
          selectedPageIndex == other.selectedPageIndex &&
          pages == other.pages &&
          isCategory == other.isCategory;

  @override
  int get hashCode =>
      selectedPageIndex.hashCode ^ pages.hashCode ^ isCategory.hashCode;
}

class MainViewCubit extends Cubit<MainViewState> {
  final apiClient = CitchenListService();
  final pages =<Widget>[
    GategoryListWidget.create(),
    CithcenElementsListWidget.create(),
    BasketWidget.create(),
    const Text(
      'Аккаунт',
    ),
  ];
  MainViewCubit() : super(MainViewState(label:'Категория',isCategory: false, selectedPageIndex: 0,pages:<Widget>[
    GategoryListWidget.create(),
    const Text(
      'Поиск',
    ),
    BasketWidget.create(),
    const Text(
      'Аккаунт',
    ),
  ])) {}


  void clickCategoryHandler(String catName) async{
    final list = state.pages;
    final dishesWidget =  CithcenElementsListWidget.create();
    if(list == []) return;
    list.removeAt(0);
    list.insert(0, dishesWidget);
    final newState = state.copyWith(pages: list, isCategory: true,label: catName);
    emit(newState);
  }

  void clickBackHandler() async{
    final list = state.pages;
    final dishesWidget =  GategoryListWidget.create();
    if(list == []) return;
    list.removeAt(0);
    list.insert(0, dishesWidget);
    final newState = state.copyWith(pages: list, isCategory: false);
    emit(newState);
  }

  void onChangeTab(int index) {
    final newIndex = index;
    print('index:${newIndex}');
    final newState = state.copyWith(selectedPageIndex:newIndex,isCategory:  false);
    emit(newState);
    clickBackHandler();
    print('isCategory:${state.isCategory}');
  }

}
