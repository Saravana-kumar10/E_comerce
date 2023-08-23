import 'dart:convert';

import 'package:e_comercesara/Login.dart';
import 'package:e_comercesara/Page0ne.dart';
import 'package:e_comercesara/navigation.dart';
import 'package:e_comercesara/youtubeplayer.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Description.dart';
import 'model/CateClass.dart';
import 'model/EcomClass.dart';
class Cart extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String id;
  Cart({super.key,
  required this.image,required this.title,required this.price,required this.id});


  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late int val;
 late bool adval;
  List Itemlist=[];
  late SharedPreferences logindata ;
  late bool logbool = false  ;
  Future<List<CheckImg>> addImgdetails() async{
    var res=await http.get(Uri.parse("https://fakestoreapi.com/products"));
    List data=jsonDecode(res.body);

    return data.map((e) =>CheckImg.fromJson(e)).toList();
  }

  void check() async
  {
    logindata = await SharedPreferences.getInstance();
    // logindata.setBool("login", true);
    // if(logindata.containsKey("login") )
    //   {
    //
    //     logbool = true;
    //   }
    // else
    //   {
    //     logbool = false;
    //   }

    logbool= logindata.containsKey("login") ?? false;
    // if(logbool==true)
    // {
    //   Navigator.pushReplacement(context,
    //       PageTransition(child: const Login(), type: PageTransitionType.fade));
    // }


  }
  @override
  void initState(){

    super.initState();

    // check();


    adval= widget.image.isEmpty ? false:true;
}
  void _addCardWidget() {


    setState(() {
      Itemlist.insert(0,ListTile(

        leading: Container(
          height: 60,
          width: 80,
          child: Image.network(widget.image,fit: BoxFit.fill,),
        ),
        title: Text(widget.title,style: TextStyle(fontSize: 20),),
        subtitle: Text(
          " ${widget.price}\n""Product id :${widget.id}",style: TextStyle(fontSize: 20),),
        trailing: IconButton(onPressed: (){
          setState(() {
            Itemlist.removeAt(val);
          });
        }, icon: Icon(Icons.minimize)),


      ));

    });


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
      body:Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed:() {
                        _addCardWidget();

    },

                      child: Icon(Icons.add),
                    ),
                    SizedBox(width: 20,),


                  ],
                ),
               Visibility(
                 visible: adval,
                 child: Container(height: 100,width: double.infinity,
                   child: ListTile(
                      leading: Container(
                        height: 60,
                        width: 80,
                        child: Image.network(widget.image,fit: BoxFit.fill,),
                      ),
                      title: Text(widget.title,style: TextStyle(fontSize: 20),),
                      subtitle: Text(
                        " ${widget.price}\n"
                            "Product id :${widget.id}",style: TextStyle(fontSize: 20),),



                    ),
                 ),
               ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(height: 900,width: 400,
                    child: ListView.builder(
                        itemCount: Itemlist.length,
                        itemBuilder: (context , index){
                          val=index;
                      return Itemlist[index];
                    }),
                  ),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }



  ListTile Lisadd()
  {
    if(widget.image.isEmpty || widget.image==widget.image){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Pageone()
      ));


    }

    return  ListTile(

      leading: Container(
        height: 60,
        width: 80,
        child: Image.network(widget.image,fit: BoxFit.fill,),
      ),
      title: Text(widget.title,style: TextStyle(fontSize: 20),),
      subtitle: Text(
        " ${widget.price}\n""Product id :${widget.id}",style: TextStyle(fontSize: 20),),
      trailing: IconButton(onPressed: (){
        setState(() {
          Itemlist.removeAt(val);
        });
      }, icon: Icon(Icons.minimize)),


    );

  }
}


