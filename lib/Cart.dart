import 'dart:convert';

import 'package:e_comercesara/Login.dart';
import 'package:e_comercesara/Page0ne.dart';
import 'package:e_comercesara/navigation.dart';
import 'package:e_comercesara/youtubeplayer.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';


import 'Description.dart';
import 'model/CateClass.dart';
import 'model/EcomClass.dart';
class Cart extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String id;
 Cart({super.key, required this.image,required this.title,required this.price,required this.id});


  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late int val;

  List Itemlist=[];


  Future<List<CheckImg>> addImgdetails() async{
    var res=await http.get(Uri.parse("https://fakestoreapi.com/products"));
    List data=jsonDecode(res.body);

    return data.map((e) =>CheckImg.fromJson(e)).toList();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Navi()
          ));

        }, icon: Icon(Icons.arrow_back)),
        title: Text("My Cart"),
      ),
      body: Container(
        height: 100, width: double.infinity,
        child: ListTile(
          leading: Container(
            height: 60,
            width: 80,
            child: Image.network(
              widget.image, fit: BoxFit.fill,),
          ),
          title: Text(
            widget.title, style: TextStyle(fontSize: 20),),
          subtitle: Text(
            " ${widget.price}\n"
                "Product id :${widget.id}",
            style: TextStyle(fontSize: 20),),


        ),
      ),
      // Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: ListView.builder(
      //       itemCount: Itemlist.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return
      //
      //
      //       },
      //     ),
      //   ),
      // ),
    );
  }




}


