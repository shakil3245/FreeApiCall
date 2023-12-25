import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;

import '../../Model/postModel.dart';
import '../../Model/postsModels.dart';
import '../../controller/postController.dart';
import '../widgets/product_card.dart';
import 'innerPage/postDetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <PostModel> postList = [];

  Future<List<PostModel>> getPostAPI() async {
    final response = await https.get(Uri.parse("https://fakestoreapi.com/products"));
    var data = jsonDecode(response.body.toString());
    log(data.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).width;
    final width = MediaQuery.sizeOf(context).width;

    final _categoris = ['Recent Post', 'Travel Post', 'News Post', 'Sports Post'];
    int categoryIndex = 0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(30)),
              child: Icon(
                Icons.add_chart_rounded,
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome,",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                Text(
                  "Our  PostHub App,",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 55,
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search Post..",
                              fillColor: Colors.grey.withOpacity(0.4),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: 45,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categoris.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                categoryIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: categoryIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Text(
                                  "${_categoris[index]}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Posts",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(
                  height:10,
                ),
                SizedBox(
                  height: 400,
                  child: Expanded(
                    child: FutureBuilder(future:getPostAPI() , builder: (context,snapshot){
                      if(!snapshot.hasData){
                        return const Center(child: CircularProgressIndicator());
                      }else{
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder:(context,index){
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDetailsScreen(postname: postList[index].title.toString() , postDescriptions: postList[index].body.toString(),)));
                                },
                                child: Card(child:ListTile(
                                  leading:Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Icon(Icons.arrow_forward,color: Colors.white,),
                                  ),
                                  title: Text(postList[index].title.toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                                ) ,),
                              );
                            });
                      }
                    }),
                  ),
                )


              ],
            ),
          ),
        ),
      )
      );
  }
}
// productCard(height: 270, productImages: snapshot.data![index].image.toString(), productTitle: snapshot.data![index].title.toString(), Description:snapshot.data![index].description.toString(), ProductPrice: snapshot.data![index].price.toString(),);