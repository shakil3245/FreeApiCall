import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import '../Model/postsModels.dart';
class PostController extends GetxController{

  List <PostsModel> postList = [];

  Future<List<PostsModel>> getPostAPI() async {
    final response = await https.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    var data = jsonDecode(response.body.toString());
    log(data.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }






//I try to develop this api but its not working as my desired

//   bool _productsInProgress = false;
//   bool get productsInProgress => _productsInProgress;
//
//   ProductModel _productModel = ProductModel();
//   ProductModel get productModel => _productModel;
//   final List<ProductModel> productList = [];
//
//   Future<bool> getProducts() async {
//     _productsInProgress = true;
//     update();
//     final response = await NetworkCaller.getRequest(
//         url: "https://fakestoreapi.com/products");
//     _productsInProgress = false;
//     if (response.isSuccess) {
//           // ProductModel.fromJson(response.returnData);
//       for(Map i in response.returnData ){
//            productList.add(ProductModel.fromJson(i));
//           }
//       update();
//       return true;
//     } else {
//       update();
//       return true;
//     }
//   }


}
