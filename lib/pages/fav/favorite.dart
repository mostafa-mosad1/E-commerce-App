import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Dio/dio_helper.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/pages/Home/Dio/CubitHome.dart';
import 'package:shop_app/pages/Home/Dio/StateHome.dart';

import '../../ShareReference/ShareReference.dart';
import '../../compant.dart';

class favorite extends StatelessWidget {
  const favorite({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=homeCubit.get(context).getFavoritemodel;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<homeCubit,homeState>(
          builder: (context, state) => ConditionalBuilderRec(
              condition: homeCubit.get(context).getFavoritemodel != null ,
          builder:(context) => ListView.separated(
              itemBuilder:(context,index) =>FavoriteShopDesign(
                title:cubit?.data?.data?[index].product?.name,
                url: cubit?.data!.data?[index].product?.image,
                price: cubit?.data!.data?[index].product?.price.toString(),
                oldPrice: cubit?.data!.data?[index].product?.oldPrice.toString(),
                favorite:homeCubit.get(context).homeModel!.data.products![index].inFavorites,
                discount: cubit?.data!.data?[index].product?.discount.toString(),

              )  ,
              separatorBuilder: (context, index) => SizedBox(height: 10,),
              itemCount: cubit!.data!.data!.length),
          fallback: (context) =>
              Center(child: CircularProgressIndicator(
            color: Colors.deepOrange,
            backgroundColor: Colors.indigoAccent,
            strokeWidth: 6,
          ))
               ),
          listener: (context, state) {

          },),
    );
  }
}
