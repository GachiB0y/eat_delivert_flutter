import 'package:eat_delivery_flutter/domain/blocs/dishes_cubit.dart';
import 'package:eat_delivery_flutter/domain/entity/category.dart';
import 'package:eat_delivery_flutter/domain/entity/citchen_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CithcenElementsListWidget extends StatefulWidget {
  CithcenElementsListWidget({
    Key? key,
  }) : super(key: key);


  static Widget create() {
    return BlocProvider<DishesViewCubit>(
      create: (context) => DishesViewCubit(),
      child: CithcenElementsListWidget(),
    );
  }

  @override
  State<CithcenElementsListWidget> createState() => _CithcenElementsListWidgetState();
}

class _CithcenElementsListWidgetState extends State<CithcenElementsListWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:_DishesWidget()
    );
  }
}

class _DishesWidget extends StatelessWidget {

  _DishesWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DishesViewCubit>();
    final List<CitchenElement> dishes =cubit.state.itemsGet;
    return Center(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 140,
              child: _DishesRowWidget(
                index: index,
              ),
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
    final List<CitchenElement> categories =cubit.state.itemsGet;
    // final name = categories[index].name;
    return Column(
        children:[
          SizedBox(
            height:97 ,
            child: Image.network(
              "https://lh3.googleusercontent.com/fife/APg5EOb3-gGunBAb_3E7L5qZLGIx0Wm8kh4UjNn2yow-7Kvf50D7eFb9Iw5g_7W7TQLGKF29-G6VNa7dHS_zEWY8VaSMh9EqUql8UEFISB_WWgiO8nf_mt0YtUhsWFB5uzw-Bfi_eS9Cs-0vLUMiqaqTGgGFDvVhUvak4AypPMEbt2-3mEkxeZNcClEy29x8gEmUU6e9G8s5GDyCxR404OIsgnGHqtIaGIGD7afRoz7PtgtmZdlXC5v7dHujDNh5l28v249qxjpa1rqxoorBb-ywkRsu1bzqDEHGbRDnFNLXHwEGlHoLS1krz9KcD3opkmQckg7-m7PXzEhnQlayqMPiNGP-WpnFYrthFVfJ0TY4zsYFx1azSJZTLa59Xuqr32eagNn9xF6mCPpGqRbunBKrbD-oWidQ_iAXZRRrgjZrv280Joe8z73AluN0A-mXcqRkpVwQo1n3szZ00wX7sD44PriRwHGUfEenTC5IyLVv3MBsYMNXJ9ALa6FZgTrnUhO_ePGoPftELYGNp4yn-xkzfM_GvnQR8A6od0bR8AqqpNketd0kBavJTkaJXBwsfvxinTdLfOTfWsZAhF97XYNEA_9SmTgnnOjt3N8YUxmUeWcor174r7bNdDuDQqq7vWRgFZNorh5v6LANRk0CVsq6B9tVxP2R1zTCc1yXgpu4kNGJsEvNyxMRy-yM3cBvhu01ZUFSalvwAqcS2M9_eBoPCu00KVtcEvyFPoqm_QNHBEkDLjUdtJC7BGcmv7SPa-rV6oH_3zeIYstyKLrgN-Dzewe816A6J7IN4YxSvCIOWbNV9Q6O3hxua_ZrGSk6ijSoBKE0XHUC04cr1O6BzRxL9lwVUhzvBzYfzmBzMPb84Pq-WwBtfCxN2j34NReGu5iABuA1iDNgz0r8WE2Dvvz0XsD6Uc8neX57A7_19J6vyJEhuARJREXGs4tFWHMmjqg-xwYOOPJhxF1BkCaQrUEKtFYBq1pT2N7_h9fMV8JOLP92grJFHRP6TmNrEjPAf9HjfYRFouBAqFMRy614VrJu5hyweBcy-4WbJNYqrvKZH_bXIQyZ6qlv4omHhGTSMMT9cAYTyiMm12bEH5ccThAygPaXlfx6ydA3towLnMpoq0ieByM2-Nql2uh4xPxgAHcmzipRgEqlYDflDKNSfeTVFKKQ4vtTWa43wR505BTjdO3mk5CVoK4sOzwcF1mQA2joVXdW63wbUWtw4wtfa3e9EP1TV01b5M02KKPcr2yxZpNQCo8-Igp6M8t_vqWSKlkq-Z7NaRswW-xQyuFWjCufwgpd1m8i5Z4tnL72DhelmIiI2cXufJb70_eobyMV5VsMUab1nLKWoKwggolnEjl2A1PLrv6T0aRTYmjt3JqFDEV58aIjZhhyrcX6h6Bb_AJzc-OFvFPw1uAuswJaimihZUfYoVuwtNRI27BD7KGnXzMHKthOM4fArK3ICIt61g91DNHAu9qhpWxsj0FrcmujdWE2vJpBf7XoOcgxiRlRKpljQ2c3M6ULTdS1nuypZleouOtwIHOUoxGtT5HJeC8ZcsgI3przMt97iGmSv5Us7xL0j42wVNZbQnyQ6EsIyIG1ZOo2ah9CyA7RqixQUevdzbPhSnJk2w6weuuRCDkdC4H97doLyAV_=w1366-h617",
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.20,
              child: Text('name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)
          ),
        ]
    );
  }
}

