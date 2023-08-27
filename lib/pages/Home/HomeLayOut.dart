import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/ShareReference/ShareReference.dart';

import 'package:shop_app/pages/Home/Dio/CubitHome.dart';
import 'package:shop_app/pages/Home/Dio/StateHome.dart';
import 'package:shop_app/pages/search/search.dart';
import 'package:shop_app/pages/auth/login.dart';

import '../../Dio/dio_helper.dart';
import '../../Dio/end_point/end_point.dart';
import '../../main.dart';
import '../cart/cart.dart';

class HomeLayOut extends StatelessWidget {
  HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = homeCubit.get(context);
    return BlocConsumer<homeCubit, homeState>(
      builder: (context, state) => SafeArea(
          child: Scaffold(
              appBar: AppBar(
                    leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                    search(),
                              ));
                    },
                        icon: Icon(Icons.search,color: Colors.black,size: 40)),
                    title: Text(
                      "وفر اكس ",
                      style: TextStyle(color: Colors.cyan, fontSize: 35),
                    ),
          centerTitle: true,
          actions: [
                    IconButton(
                        onPressed: () {
                          CachHelper.removeData(key: "token").then((value) {
                            if (value) {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation, secondaryAnimation) =>
                                              logIn()));
                            }
                  });
                },
                icon: Icon(Icons.door_back_door_outlined,color: Colors.black,size: 40)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  cart()));
                },
                icon: Icon(Icons.shopping_cart,color: Colors.black,size: 40,)),
          ],
        ),
        body: cubit.widget[cubit.currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            DioHelper.getData(
              url: Cart,
              token: token.toString(),
            ).then((value)
            {
             print(value.data);
            }).catchError((error)
            {
              print("errorCart is => ${error.toString()}");
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.cyan,
          unselectedItemColor: Colors.blueGrey,
          currentIndex: cubit.currentIndex,
          onTap: (value) {
            print(value);
            homeCubit.get(context).current(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          ],
        ),
      )),
      listener: (context, state) {},
    );
  }
}
