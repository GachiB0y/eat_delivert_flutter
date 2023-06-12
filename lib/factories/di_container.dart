
import 'package:eat_delivery_flutter/domain/api_client/api_client_category.dart';
import 'package:eat_delivery_flutter/domain/api_client/api_client_dishes.dart';
import 'package:eat_delivery_flutter/domain/blocs/cart_cubit.dart';
import 'package:eat_delivery_flutter/domain/blocs/main_screen_bloc.dart';
import 'package:eat_delivery_flutter/main.dart';
import 'package:eat_delivery_flutter/my_app.dart';
import 'package:eat_delivery_flutter/ui/widget/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppFactory makeFactoryApp() => const _AppFactoryDefault();

class _AppFactoryDefault implements AppFactory {
  final _diContainer = const _DIContainer();
  const _AppFactoryDefault();

  @override
  Widget makeApp() => MyApp(
     screenFactory: _diContainer._makeScreenFactory(),
  );
}

class _DIContainer {
  const _DIContainer();
  final apiClientDishes = const CitchenListService();
  final apiClientCategory = const CategoryListService();
  ScreenFactoryDefault _makeScreenFactory() => ScreenFactoryDefault(this);
}


class ScreenFactoryDefault implements ScreenFactory {
  final _DIContainer _diContainer;
  const ScreenFactoryDefault(this._diContainer);

  @override
  Widget makeUserMainScreen() {
   return
     MultiBlocProvider(
       providers: [
         BlocProvider<CartViewCubit>(
         create: (context) => CartViewCubit(),
         ),
         BlocProvider<MainViewCubit>(
         create: (context) => MainViewCubit(apiClient: _diContainer.apiClientDishes),
         ),
       ],
       child: UserMainScreen(),
     );
  }
}
