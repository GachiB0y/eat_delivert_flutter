
import 'package:eat_delivery_flutter/ui/widget/citchen_widget.dart';
import 'package:eat_delivery_flutter/ui/widget/component/categories_widget.dart';
import 'package:eat_delivery_flutter/ui/widget/component/tab_bar_widget.dart';
import 'package:flutter/material.dart';

class UserMainScreen extends StatefulWidget {
  UserMainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  var selectedPageIndex = 0;

  var pages = <Widget>[

    GategoryListWidget.create(),
    CithcenElementsListWidget.create(),
    const Text(
      'Корзина',
    ),
    const Text(
      'Аккаунт',
    ),
  ];

  void onChangeTab(int index) {
    setState(() {
      selectedPageIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    final local =Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Header Container
            Container(
              // decoration: BoxDecoration(
              //   color: Colors.white,
              // ),
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              padding: const EdgeInsets.only(left:18.0 ,right: 18.0,top: 18.0,bottom: 8.0),
              color: Colors.white,
              alignment: Alignment.center,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        child: CircleAvatar()),
                ],
              ),
            ),

            //Body Container
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child:  pages[selectedPageIndex],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height  * 0.1,
        child: TabBarWidget(
            index: selectedPageIndex,
            onChangeTab: (index) => onChangeTab(index)),
      ),
    );
  }
}



// Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               StreamBuilder<User?>(
//                 stream: FirebaseService().auth.userChanges(),
//                 builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
//                   if (snapshot.data == null) {
//                     return Text('User not found');
//                   }
//                   final user = snapshot.data!;
//                   user.reload();
//                   if (user.emailVerified) {
//                     return Text('Email: is Verify: ${user.emailVerified}');
//                   } else {
//                     return Column(
//                       children: [
//                         Text('Email: is Verify: ${user.emailVerified}'),
//                         TextButton(
//                           onPressed: () {
//                             FirebaseService().onVerifyEmail();
//                           },
//                           child: Text('Verify Email'),
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),