// import 'package:dio/dio.dart';
//
// class DioHelpr {
//   static late Dio dio;
//
//  static void inital() {
//     dio = Dio(BaseOptions(
//         baseUrl: 'https://student.valuxapps.com/api/',
//         receiveDataWhenStatusError: true,
//         headers: {'Content-Type': 'application/json',
//         "lang":"en"}
//     ));
//   }
//   // need to url if quert found
//
//   static Future<Response> getData({
//     required String url,
//     required Map<String, dynamic> query})
//   {
//     return dio.get(url, queryParameters: query);
//   }
//
// // need to url and data **not need quert found
//
//   static Future<Response> postData({
//     required String url,
//     required Map<String, dynamic> data,
//      Map<String, dynamic>? query})
//   {
//     return dio.post(url, data: data,queryParameters: query);
//   }
// }
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void inital() {
    dio = Dio(BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true));
  }
  static Future<Response> getData(
      {
        String? url,
       Map<String,dynamic>? query,
        Map<String, dynamic>? data,
        String lan ="ar",
        token,
      }) async {
   if(token != null){
      dio.options.headers ={
       "Content-Type":"application/json",
       "lang":lan,
       "Authorization":token,
     };
   }

    return await dio.get(url!, queryParameters: query,data: data);
  }

  static Future<Response> postData(
      {
        String? url,
        Map<String,
        dynamic>? data,
        String lan ="ar",
        String? token,
      }) async {
    dio.options.headers= {
          "lang":lan,
          "Authorization":token,
        };

    return await dio.post(url!, data: data);
  }

  static Future<Response> putData(
      {
        String? url,
        Map<String,
            dynamic>? data,
        String lan ="ar",
        String? token,
      }) async {
    dio.options.headers= {
      "lang":lan,
      "Authorization":token,
    };

    return await dio.put(url!, data: data);
  }
}
