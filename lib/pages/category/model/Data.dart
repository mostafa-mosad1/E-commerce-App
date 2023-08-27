// import 'Data.dart';
//
// class Data {
//   int currentPage;
//   List<Data> data;
//   String firstPageUrl;
//   int from;
//   int lastPage;
//   String lastPageUrl;
//   dynamic nextPageUrl;
//   String path;
//   int perPage;
//   dynamic prevPageUrl;
//   int to;
//   int total;
//   Data({
//       required this.currentPage,
//       required this.data,
//       required this.firstPageUrl,
//     required   this.from,
//     required    this.lastPage,
//     required    this.lastPageUrl,
//     required    this.nextPageUrl,
//     required    this.path,
//     required   this.perPage,
//       this.prevPageUrl,
//     required    this.to,
//     required    this.total,
//   });
//
//   Data.fromJson(dynamic json) {
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data.add(Data.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }
//
//
//
// }