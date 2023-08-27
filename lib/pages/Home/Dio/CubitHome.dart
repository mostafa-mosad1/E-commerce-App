import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/Home/Dio/StateHome.dart';
import 'package:shop_app/pages/cart/model/CartModel.dart';
import 'package:shop_app/pages/fav/model/addAndDeleteFavModel.dart';
import 'package:shop_app/pages/profile/profileModel/ProfileModel.dart';
import 'package:shop_app/pages/search/model/SearchModel.dart';
import '../../../Dio/dio_helper.dart';
import '../../../Dio/end_point/end_point.dart';
import '../../../main.dart';
import '../../cart/model/AddAndDeleteCart.dart';
import '../../category/category.dart';
import '../../category/model/CategoryModel.dart';
import '../../fav/favorite.dart';
import '../../fav/model/GetFavoriteModel.dart';
import '../../profile/profileModel/EditModel.dart';
import '../home.dart';
import '../modelHome/Max.dart';
import '../../profile/profile.dart';

class homeCubit extends Cubit<homeState> {
  homeCubit() : super(homeInitalState());

  static homeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> widget =[ home(),category(),favorite(),profile() ];

  void current(value){
    currentIndex =value;
    emit(currentIndex1());
  }


  HomeModel ? homeModel ;
  Map<int,bool> favoriteMap = {};

  void getHomeData()
  {
    emit(lodingHomeData());

    DioHelper.getData(
      url: Home,
      token: token.toString(),
    ).then((value)
    {
      homeModel = HomeModel.fromJson(value.data);

      homeModel?.data.products?.forEach((element) {
        favoriteMap.addAll({
          element.id:element.inFavorites,
        });
      });
      //
      // print("before =   ${favoriteMap.toString()}");

      emit(sucessHomeData(homeModel!));
    }).catchError((error)
    {
      print("errorHome is => ${error.toString()}");
      emit(erorHomeData());
    });
  }

  CategoryModel ? categery;

  void getCategoryData(){
    emit(lodingCategaryDate());
    DioHelper.getData(
        url: Category,
        token: token.toString()
    ).then((value) {
      categery = CategoryModel.fromJson(value.data);

      emit(susesslodingCategaryDate(categery));
    }).catchError((err){
      print("errorCategory is => ${err.toString()}");
      emit(errorlodingCategaryDate(err.toString()));
    });
  }


  GetFavoriteModel ? getFavoritemodel;

void  getFavoriteData(){
    emit(lodingFavoriteData());
    DioHelper.getData(
      url: FavoriteHome,
      token: token.toString()
    ).then((value) {
      // print(value.data.toString());
      getFavoritemodel=GetFavoriteModel.fromJson(value.data);
      emit(sucessFavoriteData(getFavoritemodel));

    }).catchError((error){
      print("errorFav is => ${error.toString()}");
      emit(erorFavoriteData());
    });
}


  AddAndDeleteFavModel ? addAndDeleteFavModel;



  void  ChangeFavoriteIcon({int? productId}){
    // favoriteMap[productId] != favoriteMap[productId];
    // homeModel?.data.products?[0].inFavorites != homeModel?.data.products?[0].inFavorites;
    //
    // emit( sucessChangeFavoriteIcon(addAndDeleteFavModel));
    DioHelper.postData(
        url: FavoriteHome,
        token: token.toString(),
      data: {
          "product_id":productId
      }
    ).then((value) {
      print(value.data.toString());
      addAndDeleteFavModel=AddAndDeleteFavModel.formJson(value.data);

      emit(sucessChangeFavoriteIcon(addAndDeleteFavModel));


    }).catchError((error){
      print("errorAddAndDeleteFav is => ${error.toString()}");
      emit(erorChangeFavoriteIcon());
    });

  }

  ProfileModel ? profileModel;

  void getProfileData(){
    emit(lodingProfileDate());
    DioHelper.getData(
      url: Profile,
      token: token.toString(),
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      // print(profileModel?.data?.name);
      // print("profile => ${value.data.toString()}");


      emit(susesslodingProfileDate(profileModel));
    }).catchError((error){
      print("errorProfile is =>${error.toString()}");
      emit(errorlodingProfileDate(error));
    });
  }

  EditProfileModel ? editProfileModel;

  void getEditProfileData({
    String ?name,String ?phone,String ?email,String ?password,String ?image,
}){

    emit(lodingEditProfileDate());
    DioHelper.putData(
      url: EditProfile,
      token: token.toString(),
      data: {
        "name":name,
        "phone":phone,
        "email":email,
        "password":password,
        "image":image
      }
    ).then((value) {
      editProfileModel =EditProfileModel.fromJson(value.data);

        print(editProfileModel?.message.toString());
        print(value.data.toString());
        getProfileData();


      emit(susesslodingEditProfileDate(editProfileModel));
    }).catchError((error){
     print("editProfileError is ${error.toString()}");
     emit(errorlodingEditProfileDate(error));
    });
  }

//products/search
  SearchModel ? searchModel;

  void  searchItem({String? search}){

    emit(lodingSearchDate());
    DioHelper.postData(
        url: Search,
        token: token.toString(),
        data: {
          "text":search
        }
    ).then((value) {
      print(value.data.toString());
      searchModel=SearchModel.fromJson(value.data);
      print("searec is => ${value.data.toString()}");

      emit(susesssearchDate(searchModel));


    }).catchError((error){
      print("errorSearch is => ${error.toString()}");
      emit(errorSearchDate(error));
    });

  }

  // carts

CartModel ? cartModel;
  // List<CartModel> cart;
  void getCartData()
  {
    emit(lodingCartDate());

    DioHelper.getData(
      url: Cart,
      token: token.toString(),
    ).then((value)
    {
      cartModel = CartModel.fromJson(value.data);
      // value.data.forEach((v) {
      //   cart.add(CartModel.fromJson(v));
      // });
      emit(susessCartDate(cartModel));
    }).catchError((error)
    {
      print("errorCart is => ${error.toString()}");
      emit(errorCartDate(error.toString()));
    });
  }

  int x=1;
  void increaseItem(){

    x+=1;
    print(x);
    emit(PLUSE(x));
  }

  void minusItem(){

    x-=1;
    print(x);
    emit(minus(x));
  }

  AddAndDeleteCart ? addAndDeleteCart;

  void addCartData({productId})
  {
    emit(lodingAddCartDate());

    DioHelper.postData(
      url: Cart,
      token: token.toString(),
      data: {
        "product_id":productId
      }
    ).then((value)
    {
      addAndDeleteCart = AddAndDeleteCart.fromJson(value.data);

      emit(susessAddCartDate(addAndDeleteCart));
    }).catchError((error)
    {
      print("errorAddCart is => ${error.toString()}");
      emit(errorAddCartDate(error.toString()));
    });
  }


}


