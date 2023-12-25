// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:ecommerce_task/Model/postModel.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as https;
// class AddtoCartScreen extends StatefulWidget {
//   const AddtoCartScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddtoCartScreen> createState() => _AddtoCartScreenState();
// }
//
// class _AddtoCartScreenState extends State<AddtoCartScreen> {
//   List <PostModel> postList = [];
//
//   Future<List<PostModel>> getPostAPI() async {
//     final response = await https.get(Uri.parse("https://fakestoreapi.com/products"));
//     var data = jsonDecode(response.body.toString());
//     log(data.toString());
//     if (response.statusCode == 200) {
//       for (Map i in data) {
//         postList.add(PostModel.fromJson(i));
//       }
//       return postList;
//     } else {
//       return postList;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(title: Text("HOME"),
//
//       ),
//       body: Column(children: [
//
//         Expanded(
//           child: FutureBuilder(future:getPostAPI() , builder: (context,snapshot){
//             if(!snapshot.hasData){
//               return const Center(child: CircularProgressIndicator());
//             }else{
//               return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder:(context,index){
//                     return Text(index.toString() + " "+ postList[index].title.toString()+ " "+ postList[index].body.toString());
//                   });
//             }
//           }),
//         )
//
//       ],),
//     );
//   }
// }
