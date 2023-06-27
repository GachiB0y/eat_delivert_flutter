import 'package:eat_delivery_flutter/domain/blocs/main_screen_bloc.dart';
import 'package:eat_delivery_flutter/ui/widget/component/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    final local =Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
    final cubit = context.watch<MainViewCubit>();
   final selectedPageIndex= cubit.state.selectedPageIndex;
   final pages= cubit.state.pages;
   final isCategory= cubit.state.isCategory;
   final label= cubit.state.label;
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Header Container
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              padding: const EdgeInsets.only(left:18.0 ,right: 18.0,top: 18.0,bottom: 8.0),
              color: Colors.white,
              alignment: Alignment.center,
              child:isCategory ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      cubit.clickBackHandler();
                    },
                    icon:  const Icon(Icons.arrow_back_ios_new),
                  ),
                  Text('$label'),
                  SizedBox(
                      height:MediaQuery.of(context).size.height * 0.05 ,
                      child: const CircleAvatar()),
                ],
              ):
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(width: 3,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${myLocale.countryCode}"),
                        Text('${local?.formatShortDate(DateTime.now())}'),
                      ],
                    ),
                  ),
                     SizedBox(
                      height:MediaQuery.of(context).size.height * 0.05 ,
                        child: const CircleAvatar()),
                ],
              ),
            ),
            //Body Container
            Expanded(
              child: Container(
                width: double.infinity,
                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child:pages[selectedPageIndex],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height  * 0.1,
        child: TabBarWidget(
            index: selectedPageIndex,
            onChangeTab: (index) => cubit.onChangeTab(index)
        ),
      ),
    );
  }
}
