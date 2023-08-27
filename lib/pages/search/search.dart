import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/Home/Dio/CubitHome.dart';
import 'package:shop_app/pages/Home/Dio/StateHome.dart';

import '../../compant.dart';

class search extends StatelessWidget {
   search({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = homeCubit.get(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<homeCubit,homeState>(
        listener: (context, state) {},
        builder: (context, state) => Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text(("search"))),
            Padding(
              padding:  EdgeInsets.all(12.0),
              child: DefultTextForm(
                  validatorPostion: true,
                  Textvalidator: "No Data To Search",
                  hintText: "Search",
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),
                  circular: 10,
                  onChange: (v){
                    cubit.searchItem(search: v.toString());
                    print(v.toString());
                  }),
            ),
            SizedBox(height: 20,),
            (cubit.searchModel != null)?
            Expanded(
              child: ListView.separated(
                  itemBuilder:(context,index) =>FavoriteShopDesign(
                    title:cubit.searchModel?.data?.data?[index].name,
                    url: cubit.searchModel?.data?.data?[index].images?[0],
                    price: cubit.searchModel?.data?.data?[index].price.toString(),
                    favorite:cubit.searchModel?.data?.data?[index].in_favorites,


                  )  ,
                  separatorBuilder: (context, index) => SizedBox(height: 10,),
                  itemCount: cubit.searchModel!.data!.data!.length),
            ):Container()

          ],),
      )
    ));
  }
}
