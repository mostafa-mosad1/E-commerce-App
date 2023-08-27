import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/Home/Dio/CubitHome.dart';
import 'package:shop_app/pages/Home/Dio/StateHome.dart';

class category extends StatelessWidget {
  const category({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit =homeCubit.get(context).categery;
    return BlocConsumer<homeCubit,homeState>(
      listener: (context, state) {
        print(homeCubit.get(context).categery?.status.toString());
        if(state is susesslodingCategaryDate){
         print( state.categery!.data.data?[0].name);
        }
      },
      builder: (context, state) => ConditionalBuilderRec(
          condition: cubit!.data.data?[2].image != null,
        builder: (context) => SafeArea(child: Scaffold(
        body: ListView.builder(
            itemBuilder: (context, index) => Row(
              children: [
                Image(image: NetworkImage(cubit!.data.data![index].image),width: 150,height: 150,),
                SizedBox(width: 20,),
                 Text(homeCubit.get(context).categery!.data.data![index].name.toString(),style: TextStyle(fontSize: 25,),),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
              ],),
            itemCount: cubit?.data.data?.length),
      )),
      fallback: (context) =>  Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrange,
            backgroundColor: Colors.indigoAccent,
            strokeWidth: 6,
          ))
        ,),
    );
  }
}
