import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/auth/cubit/states.dart';
import 'package:shop_app/pages/auth/model/RegisterModel.dart';
import '../../../Dio/dio_helper.dart';
import '../../../Dio/end_point/end_point.dart';
import '../model/LogInModel.dart';


class logInCubit extends Cubit<shopStates> {
  logInCubit() : super(shopInitialStates());

  static logInCubit get(context) => BlocProvider.of(context);


 LogInModel? logdata;


void logIN({required String email,required String password}){
  emit(shopLoadinglogIn());
  DioHelper.postData(
    url: "login",
    data: {
      "email":email,
      "password":password,
    }).then((value) {
      print(value);

      logdata = LogInModel.fromJson(value.data);

      emit(shopScuesslogIn(logdata!));
  }).catchError((error){
    print(error.toString());
    emit(shopErroelogIns(error.toString()));
  });
}


  RegisterModel? registerModel;


  void getRegisterData({
    String? email,
    String ?password,
    String ?name,
    String ?phone,
    String ?image,

  }){
    emit(shopLoadingRegister());
    DioHelper.postData(
        url: Register,
        data: {
          "name":name,
          "phone":phone,
          "image":image,
          "email":email,
          "password":password,
        }).then((value) {
      print(value.data.toString());

      registerModel = RegisterModel.fromJson(value.data);

      emit(shopScuessRegister(registerModel!));
    }).catchError((error){
      print(error.toString());
      emit(shopErrorRegister(error.toString()));
    });
  }
}
