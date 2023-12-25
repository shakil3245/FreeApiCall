import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as https;


import '../Model/response_model.dart';

class NetworkCaller {
  //cant create instants from other class
  NetworkCaller._();

// this function take a url that conctinate with baseurl
//   static Future<ResponseModel> getRequest({required String url}) async {
//     try {
//       final Response response =
//       await get(Uri.parse(url), headers: {
//         'Content-type': 'application/json',
//         'Accept': 'application/json',
//         // 'token': AuthController.token.toString(),
//       });
//       log(response.body);
//       log(response.statusCode.toString());
//
//       if (response.statusCode == 200) {
//         return ResponseModel(
//           isSuccess: true,
//           statusCode: response.statusCode,
//           returnData: jsonDecode(response.body),
//         );
//       } else {
//         return ResponseModel(
//           isSuccess: false,
//           statusCode: response.statusCode,
//           returnData: jsonDecode(response.body),
//         );
//       }
//     } catch (e) {
//       log(e.toString());
//       return ResponseModel(
//         isSuccess: false,
//         statusCode: -1,
//         returnData: e.toString(),
//       );
//     }
//   }
// }
//   List <ProductModel> productList = [];
//
//   Future<List<ProductModel>> getAPI(url) async {
//     final response = await https.get(Uri.parse(url));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       for (Map i in data) {
//         productList.add(ProductModel.fromJson(i));
//       }
//       return productList;
//     } else {
//       return productList;
//     }
//   }
}
