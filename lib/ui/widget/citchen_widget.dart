import 'package:eat_delivery_flutter/domain/blocs/cart_cubit.dart';
import 'package:eat_delivery_flutter/domain/blocs/dishes_cubit.dart';
import 'package:eat_delivery_flutter/domain/entity/citchen_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CithcenElementsListWidget extends StatefulWidget {
  CithcenElementsListWidget({
    Key? key,
  }) : super(key: key);


  static Widget create() {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<DishesViewCubit>(
          create: (context) => DishesViewCubit(),
        ),
      ],
      child: CithcenElementsListWidget(),
    );
  }

  @override
  State<CithcenElementsListWidget> createState() => _CithcenElementsListWidgetState();
}

class _CithcenElementsListWidgetState extends State<CithcenElementsListWidget> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:const _DishesWidget()
    );
  }
}

class _DishesWidget extends StatelessWidget {

  const _DishesWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DishesViewCubit>();
    final cubitCart = context.watch<CartViewCubit>();
    final List<CitchenElement> dishes =cubit.state.itemsGet;
    return Center(
      child: GridView.builder(
        itemCount: dishes.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children:[
                _DishesRowWidget(index: index,),
              SizedBox(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => _AlertDialogWidget(index: index, cubit: cubit, cubitCart: cubitCart,),
                      ),
                  ),
                ),
              ),
              ]
            );
          },
      ),
    );
  }
}

class _DishesRowWidget extends StatelessWidget {
  final int index;
  _DishesRowWidget(
      {Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DishesViewCubit>();
    final List<CitchenElement> dishes =cubit.state.itemsGet;
    final name = dishes[index].name;
    final url = dishes[index].imageUrl;
    return Column(
      mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(
            height: 110,
            width: 110,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(3),
              ),
            child: url !=null ? Padding(
              padding: const EdgeInsets.only(left:8.0,top: 12.0),
              child: Image.network(
                "${url}",
             fit: BoxFit.contain,
             alignment: Alignment.center,
              ),
            ) :const SizedBox.shrink(),
          ),
          Container(
               width: MediaQuery.of(context).size.width * 0.30,
              child: Text('${name}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),)
          ),
        ]
    );
  }
}

class _AlertDialogWidget extends StatelessWidget {
  final int index;
  final DishesViewCubit cubit;
  final CartViewCubit cubitCart;

  const _AlertDialogWidget({Key? key, required this.index, required this.cubit, required this.cubitCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = cubit.state.itemsGet[index].id;
    final name = cubit.state.itemsGet[index].name;
    final description = cubit.state.itemsGet[index].description;
    final price = cubit.state.itemsGet[index].price;
    final weight = cubit.state.itemsGet[index].weight;
    final url = cubit.state.itemsGet[index].imageUrl;
    return
      Dialog(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(20.0)), //this right here
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              // height: MediaQuery.of(context).size.height * 0.54,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                          Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                           child: url !=null ? Padding(
                            padding: const EdgeInsets.only(left:8.0,top: 12.0),
                            child: Image.network(
                              "${url}",
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                           ) : const SizedBox.shrink(),
                        ),
                        Positioned(
                          top: 10,
                          left:MediaQuery.of(context).size.width * 0.46,
                          child: Row(children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(onPressed: () {

                              }, icon:const Icon(Icons.star_outline)),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(onPressed: () {
                                Navigator.of(context).pop();
                              }, icon:const Icon(Icons.close)),
                            ),
                          ],),
                        ),
                      ]
                    ),
                    const SizedBox(height: 5,),
                    Text('${name}',style: const TextStyle(fontWeight: FontWeight.w600),),
                    Row(
                      children: [
                        Text('${price} ₽'),
                        const Text(' • ',style: TextStyle(color: Colors.grey),),
                        Text('${weight} г',style: const TextStyle(color: Colors.grey),),
                      ],
                    ),
                    Text('${description}',style:const TextStyle(fontSize: 13),),
                    const SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent[700],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                          onPressed: () {
                            cubitCart.incrementDishes(id);
                            print('ADD');
                            Navigator.of(context).pop();
                          },
                          child: const Text('Добавить в корзину',style: TextStyle(color: Colors.white),),
                        ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
