import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/Home/Dio/CubitHome.dart';

import '../../compant.dart';
import '../Home/Dio/StateHome.dart';
import 'editProfile.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = homeCubit.get(context).profileModel;
    return BlocConsumer<homeCubit,homeState>(
      listener: (context, state) {
        // if(state is susesslodingEditProfileDate){
        //
        //   ShowToast(text: homeCubit.get(context).editProfileModel!.message.toString(),stutes:toastStutes.suess );
        //
        //   Navigator.pop(context);
        //
        //
        // }else{
        //   ShowToast(text: homeCubit.get(context).editProfileModel!.message.toString(),stutes:toastStutes.error );
        //
        // }
      },
      builder: (context, state) =>  ConditionalBuilderRec(
          condition: (true),
          builder: (context) => SafeArea(child: Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset(
                    "assets/5.jpg",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (c) => editProfile(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.settings,
                                size: 40,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  // homeCubit.get(context).getEditProfileData();
                                  homeCubit.get(context).getProfileData();
                                },
                                icon: Icon(Icons.refresh)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                          child:cubit?.data?.image != null?
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/photo.jpg"),
                                    fit: BoxFit.cover),
                                border: Border.all(color: Colors.black, width: 2),
                                borderRadius:
                                BorderRadius.all(Radius.circular(140))),
                            width: 190,
                            height: 190,
                          )
                              :Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(cubit!.data!.image.toString()),
                                    fit: BoxFit.fill),
                                border: Border.all(color: Colors.black, width: 2),
                                borderRadius:
                                BorderRadius.all(Radius.circular(140))),
                            width: 190,
                            height: 190,
                          )
                      ),
                      Center(
                        child: Text(
                          cubit!.data!.name.toString(),
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      Center(
                        child: Text(
                          "${cubit.data!.email.toString()}",
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "Phone",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "${cubit.data!.phone.toString()}",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "ID",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "${cubit.data!.id}",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),


                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
           fallback:(context) => Center(
               child: CircularProgressIndicator(
                 color: Colors.deepOrange,
                 backgroundColor: Colors.indigoAccent,
                 strokeWidth: 6,
               ))
        ,)
    );
  }
}
