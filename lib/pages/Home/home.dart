import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/compant.dart';
import 'package:shop_app/pages/Home/Dio/CubitHome.dart';
import 'package:shop_app/pages/Home/Dio/StateHome.dart';

import 'modelHome/Max.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = homeCubit.get(context);
    return BlocConsumer<homeCubit, homeState>(
      listener: (context, state) {
      },
      builder: (context, state) => SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
               body: ConditionalBuilderRec(
                  condition: cubit.homeModel != null && cubit.categery != null&&cubit.getFavoritemodel != null,//&&cubit.addAndDeleteFavModel != null,
                  builder: (context) => SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          slider(model: cubit.homeModel),
                           SizedBox(height: 15,),
                          Text("Category   ",style: TextStyle(fontSize: 25)),

                          Container(
                            padding: EdgeInsets.only(left: 8,right: 8),
                            width: double.infinity,height: 150,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Image(image: NetworkImage(cubit.categery!.data.data![index].image),width: 150,height: 120,),
                                    Container(
                                        width: 100,
                                        color: Colors.black12.withOpacity(0.6),
                                        child: Text(cubit.categery!.data.data![index].name,
                                          textAlign:TextAlign.center,
                                          style: TextStyle(fontSize: 15,color: Colors.white,),))
                                  ],),
                              separatorBuilder:(context, index) => SizedBox(width: 5,) ,
                              itemCount:5 ,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text("New products   ",style: TextStyle(fontSize: 25,)),
                          GridView.builder(
                            clipBehavior: Clip.antiAlias,
                            shrinkWrap: true,
                      physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.59,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2


                      ),
                      itemBuilder: (context, index) => HomeShopDesign(
                          title: "${cubit.homeModel!.data.products?[index].name}",
                          url: "${cubit.homeModel!.data.products?[index].image}",
                          price: "${cubit.homeModel!.data.products?[index].price.round()}",
                          oldPrice: "${cubit.homeModel!.data.products?[index].oldPrice.round()}",
                          shop: cubit.homeModel!.data.products![index].inCart,
                          favorite: homeCubit.get(context).favoriteMap[homeCubit.get(context).homeModel?.data.products?[index].id]!,
                          discount: cubit.homeModel!.data.products![index].discount,

                        onPressedIconFav: (){
                            cubit.ChangeFavoriteIcon(productId:cubit.homeModel!.data.products![index].id);
                            cubit.getHomeData();
                            cubit.getFavoriteData();
                          },
                        onPressedIconCart: (){
                            homeCubit.get(context).addCartData(productId: cubit.homeModel?.data.products?[index].id);
                            cubit.getHomeData();
                            cubit.getCartData();
                        }

                      ),
                      itemCount: cubit.homeModel?.data.products?.length,
                    ),
                  ],
                ),
              ),
            ),
                 fallback: (context) => Center(
                    child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                  backgroundColor: Colors.indigoAccent,
                  strokeWidth: 6,
            )),
        ),
      ),
          )),
    );
  }

  Widget slider({HomeModel? model}) => CarouselSlider(
      items: model?.data.banners?.map((e) {
        return Image(
            image: NetworkImage(e.image),
            width: double.infinity,
            // height: 100,
            fit: BoxFit.cover);
      }).toList(),
      options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: Duration(seconds: 2),
          reverse: false,
          autoPlayInterval: Duration(seconds: 4),
          initialPage: 0,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          // height: 200,
          clipBehavior: Clip.antiAlias));
}
