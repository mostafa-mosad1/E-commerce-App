import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/Home/Dio/StateHome.dart';

import '../Home/Dio/CubitHome.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit1 = homeCubit.get(context);
   var cubit = homeCubit.get(context).cartModel?.data?.cartItems;
   var pluse=1;


    return BlocConsumer<homeCubit,homeState>(
      listener: (context, state) {
        if(state is PLUSE || state is minus){
          pluse = BlocProvider.of<homeCubit>(context).x;
        }
      },
      builder: (context, state) => SafeArea(
          child: Scaffold(
            appBar: AppBar(),
                body:  ConditionalBuilderRec(
                    condition: state is !lodingCartDate ,
                    builder: (context) =>  ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 250,height: 350,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black, width: 1)),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:  MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 10,top: 10),
                                          width: 130,
                                          height: 150,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                                          child:  ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            child: Image.network("${cubit?[index].product?.image}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      ]),
                                  Container(padding:EdgeInsets.only(left: 20),),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Name : ${cubit?[index].product?.name.toString()} ",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Item : ${cubit?[index].quantity.toString()} ",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "price : ${cubit?[index].product?.price.round()} El ",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          homeCubit.get(context).minusItem();
                                          // cubit?[index].quantity -= 1;
                                          // cubit?[index].quantity = cubit?[index].quantity - 1;

                                        },
                                        icon: Icon(
                                          Icons.indeterminate_check_box,
                                          size: 20,
                                        ),
                                        color: Color(0xff269A41),
                                      ),
                                      Text("${pluse}"),
                                      IconButton(
                                        onPressed: () {
                                          homeCubit.get(context).increaseItem();
                                          print(pluse);

                                          // setState(() {
                                          //   myCart[index].quantity += 1;
                                          //   var x = (myCart[index].product.price.toInt + myCart[index].quantity.toInt());
                                          //   print(x);
                                          // });
                                        },
                                        icon: Icon(
                                          Icons.add_box,
                                          size: 20,
                                        ),
                                        color: Color(0xff269A41),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                          color: Colors.green),
                                      child: MaterialButton(
                                        onPressed: () {
                                          // increase(myCart[index].quantity.toInt(), myCart[index].id);

                                        },
                                        child: Text(
                                          "save",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                          color: Color(0xffA20808)),
                                      child: MaterialButton(
                                        onPressed: () {
                                          homeCubit.get(context).addCartData(productId: cubit1.homeModel?.data.products?[index].id);
                                          cubit1.getHomeData();
                                          cubit1.getCartData();
                                        },
                                        child: Text(
                                          "Remove",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],)


                        ),
                      ),
                      itemCount: homeCubit.get(context).cartModel!.data!.cartItems!.length,
                      separatorBuilder: (context, index) => SizedBox(height: 10,),
                    ),
                  fallback: (context) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Center(child: Text("Cart is empty",style: TextStyle(fontStyle:FontStyle.italic,fontSize: 30,color: Colors.redAccent,),)),
                   SizedBox(width: 12,),
                    CircularProgressIndicator(
                      color: Colors.red,
                      backgroundColor: Colors.indigoAccent,
                      strokeWidth: 6,
                    ),
                  ],)
                )




      )),
    );
  }
}
