import 'package:eat_delivery_flutter/domain/blocs/cart_cubit.dart';
import 'package:eat_delivery_flutter/domain/entity/citchen_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class BasketWidget extends StatefulWidget {
  BasketWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BasketWidget> createState() => _BasketWidgetState();
}

class _BasketWidgetState extends State<BasketWidget> {

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
    final cubit = context.watch<CartViewCubit>();
    final List<CitchenElement> dishes =cubit.state.itemsGet;
    final String allPrice = cubit.allPrice().toString();
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:  dishes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: _CartRowWidget(
                      index: index,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 8.0,top: 8.0),
            child:   Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {},
                child:  Text('Оплатить:${allPrice}',style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
       
        ],
      ),
    );
  }
}

class _CartRowWidget extends StatelessWidget {
  final int index;
  _CartRowWidget(
      {Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CartViewCubit>();
    final List<CitchenElement> dishes =cubit.state.itemsGet;
    final id = dishes[index].id;
    final name = dishes[index].name;
    final price = dishes[index].price;
    final weight = dishes[index].weight;
    final url = dishes[index].imageUrl;
    final count = dishes[index].count;
    return Container(
      child:count != 0 ?
          Row(children: [
            url !=null ? Image.network(
              "${url}",
              height: 50,
              width: 50,
            ): const SizedBox.shrink(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text('${name}',style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 13),),
                Row(children: [
                  Text('${price} ₽'),
                  const Text(' • ',style: TextStyle(color: Colors.grey),),
                  Text('${weight} г',style: const TextStyle(color: Colors.grey),),
                ],),
              ],),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                IconButton(
                    onPressed: () {
                      cubit.decrementDishes(id);
                    },
                    icon: const Icon(Icons.remove)
                ),
                Text("${count}"),
                IconButton(
                    onPressed: () {
                      cubit.incrementDishes(id);
                    },
                    icon: const Icon(Icons.add)
                ),
              ],),
            ),

          ],
          ) : const SizedBox.shrink(),
    );
  }
}

