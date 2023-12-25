import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDetailsScreen extends StatefulWidget {
  String postname, postDescriptions;
   PostDetailsScreen({Key? key,required this.postname, required this.postDescriptions}) : super(key: key);
  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Detsils"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Card(child:ListTile(
            title: Text(widget.postname.toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
            subtitle: Text(widget.postDescriptions.toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
          ) ,),
        ],),
      ),
    );
  }
}
