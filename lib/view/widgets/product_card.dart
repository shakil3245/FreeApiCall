
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class productCard extends StatelessWidget {
  String productImages , productTitle, Description, ProductPrice;
   productCard({
    super.key,
    required this.height,
    required this.productImages,
    required this.productTitle,
    required this.Description,
    required this.ProductPrice,

  });

  final double height;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: 166,
      child: Column(
        children: [
          Stack(
              children:[
                ClipRRect(
                  child: Image.network(
                    productImages,
                    height: height * 0.47,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                Positioned(
                  top: 12,
                  right: 10,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.favorite_border,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),)
              ]
          ),
          SizedBox(height: height * 0.03,),
          Text(productTitle,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
          Text(Description,style: TextStyle(fontSize: 13),),
          Text(ProductPrice,style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
