import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Dio/dio_helper.dart';
import 'package:shop_app/ShareReference/ShareReference.dart';
import 'package:shop_app/pages/Home/Dio/CubitHome.dart';
import 'package:shop_app/pages/Home/HomeLayOut.dart';
import 'package:shop_app/pages/auth/cubit/observer.dart';
import 'package:shop_app/pages/auth/login.dart';


import 'pages/BordingScreen/onBordingScreen.dart';


void main()  async {

  WidgetsFlutterBinding.ensureInitialized();


  Bloc.observer = MyBlocObserver();
  DioHelper.inital();
 await CachHelper.initial();
   bool? onBording = CachHelper.getData(key:'onBording');
  // String? token = CachHelper.getData(key:'token');
  print("token = ${token.toString()}");
  Widget widget;

  if(onBording != null){
    if(token != null) widget = HomeLayOut();
    else{
      widget = logIn();
    }
  }else{
    widget = onBordingScreen();
  }



  runApp(  MyApp(StartingWidget: widget));


}

class MyApp extends StatelessWidget {
   MyApp({required this.StartingWidget});
final Widget StartingWidget;

  @override
  Widget build(BuildContext context) {
    return   MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => homeCubit()..getHomeData()..getCategoryData()..getFavoriteData()..getProfileData()..getCartData()

        ),

      ],
      child: MaterialApp(

            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: StartingWidget
            // save onbording value in the sharedPreferences
            //onBording? logIn():onBordingScreen()

      ),
    );
  }
}
String? token = CachHelper.getData(key:'token');

