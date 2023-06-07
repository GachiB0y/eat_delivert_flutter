import 'package:eat_delivery_flutter/domain/blocs/catrgories_cubit.dart';
import 'package:eat_delivery_flutter/domain/entity/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GategoryListWidget extends StatefulWidget {
  GategoryListWidget({
    Key? key,
  }) : super(key: key);

  static Widget create() {
    return BlocProvider<CategoriesViewCubit>(
      create: (context) => CategoriesViewCubit(),
      child: GategoryListWidget(),
    );
  }

  @override
  State<GategoryListWidget> createState() => _GategoryListWidgetState();
}

class _GategoryListWidgetState extends State<GategoryListWidget> {
  @override
  // void initState() {
  //  widget.cubit = context.watch<CategoriesViewCubit>();
  //  WidgetsBinding.instance.addPostFrameCallback((_){
  //    widget.cubit.loadCategories();
  //  });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_CategoryWidget()
    );
  }
}

class _CategoryWidget extends StatelessWidget {

  _CategoryWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CategoriesViewCubit>();
    final List<Category> categories =cubit.state.itemsGet;
    return Center(
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount:  categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _CatgeoryRowWidget(
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CatgeoryRowWidget extends StatelessWidget {
  final int index;
  _CatgeoryRowWidget(
      {Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CategoriesViewCubit>();
    final List<Category> categories =cubit.state.itemsGet;
    final name = cubit.changeString(categories[index].name);
    return Container(
      // height: 200,
      // width: 200,
      // padding: const EdgeInsets.only(left: 6, right: 6),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(3),
      // ),
      child:
      Stack(
        children:[
          Image.network(
            "${categories[index].imageUrl}",
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0,top: 12.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
                child: Text('${name}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.175,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                  print('CLICK!');
                  } //model.onFriendsTap(context,index),
              ),
            ),
          ),
        ]
      ),
      );
  }
}

