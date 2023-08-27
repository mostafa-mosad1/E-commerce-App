 import 'package:flutter/foundation.dart';
import 'package:shop_app/pages/Home/modelHome/Max.dart';
import 'package:shop_app/pages/Home/modelHome/modelHome.dart';
import 'package:shop_app/pages/cart/model/AddAndDeleteCart.dart';
import 'package:shop_app/pages/cart/model/CartModel.dart';
import 'package:shop_app/pages/category/model/CategoryModel.dart';
import 'package:shop_app/pages/fav/model/addAndDeleteFavModel.dart';
import 'package:shop_app/pages/profile/profileModel/EditModel.dart';
import 'package:shop_app/pages/profile/profileModel/ProfileModel.dart';
import 'package:shop_app/pages/search/model/SearchModel.dart';
import '../../fav/model/GetFavoriteModel.dart';
import '../modelHome/modelHome.dart';

class homeState {}

 class homeInitalState extends homeState{}

 class currentIndex1 extends homeState{}

 class lodingHomeData extends homeState{}
 class sucessHomeData extends homeState{
 final HomeModel? homeModel;
 sucessHomeData(this.homeModel);
 }
 class erorHomeData extends homeState{}




 class lodingCategaryDate extends homeState{}
 class susesslodingCategaryDate extends homeState{
 final CategoryModel? categery;
 susesslodingCategaryDate(this.categery);
 }
 class errorlodingCategaryDate extends homeState{
  String err;
  errorlodingCategaryDate(this.err);
 }



 class lodingFavoriteData extends homeState{}
 class sucessFavoriteData extends homeState{
  final GetFavoriteModel ?getFav;
  sucessFavoriteData(this.getFav);
 }
 class erorFavoriteData extends homeState{}



 class lodingChangeFavoriteIcon extends homeState{}
 class sucessChangeFavoriteIcon extends homeState{
  final AddAndDeleteFavModel ?addAndDeleteFavModel;

  sucessChangeFavoriteIcon(this.addAndDeleteFavModel);
 }
 class erorChangeFavoriteIcon extends homeState{}




 class lodingProfileDate extends homeState{}
 class susesslodingProfileDate extends homeState{
  final ProfileModel? profileModel;
  susesslodingProfileDate(this.profileModel);
 }
 class errorlodingProfileDate extends homeState{
  String err;
  errorlodingProfileDate(this.err);
 }


 class lodingEditProfileDate extends homeState{}
 class susesslodingEditProfileDate extends homeState{
  final EditProfileModel? editProfileModel;
  susesslodingEditProfileDate(this.editProfileModel);
 }
 class errorlodingEditProfileDate extends homeState{
  String err;
  errorlodingEditProfileDate(this.err);
 }

// Search
 class lodingSearchDate extends homeState{}
 class susesssearchDate extends homeState{
  final SearchModel? searchModel;
  susesssearchDate(this.searchModel);
 }
 class errorSearchDate extends homeState{
  String err;
  errorSearchDate(this.err);
 }


 // Cart

 class lodingCartDate extends homeState{}
 class susessCartDate extends homeState{
  final CartModel? cartModel;
  susessCartDate(this.cartModel);
 }
 class errorCartDate extends homeState{
  String err;
  errorCartDate(this.err);
 }

 // cart item
 class PLUSE extends homeState{
 int x;
 PLUSE(this.x);
 }
 class minus extends homeState{
  int x;
  minus(this.x);
 }

 class lodingAddCartDate extends homeState{}
 class susessAddCartDate extends homeState{
  final AddAndDeleteCart? addAndDeleteCart;
  susessAddCartDate(this.addAndDeleteCart);
 }
 class errorAddCartDate extends homeState{
  String err;
  errorAddCartDate(this.err);
 }



