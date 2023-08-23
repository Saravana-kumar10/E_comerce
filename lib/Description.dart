import 'dart:convert';

import 'package:e_comercesara/Cart.dart';
import 'package:e_comercesara/Page0ne.dart';
import 'package:e_comercesara/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:http/http.dart' as http;

import 'model/CateClass.dart';
import 'model/EcomClass.dart';

class DetailsPage extends StatefulWidget {
  final String count;
  final String des;
  final String amnt;
  final String Rating;
  final String image;
  final String price;
  final String title;
  final String id;

  DetailsPage(this.count,this.des,this.Rating,this.amnt,this.image,this.price,this.title,this.id);


  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<List<CheckImg>> Imgdetails() async{
    var res=await http.get(Uri.parse("https://fakestoreapi.com/products"));
    List data=jsonDecode(res.body);

    return data.map((e) =>CheckImg.fromJson(e)).toList();
  }

  @override
  void initState() {

    super.initState();
    // print(widget.prodId);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Navi()
          ));

        }, icon: Icon(Icons.arrow_back)),
        title: Text("Product Description"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
                  children:[
                Container(height: 400,width: 500,child: Image.network(widget.image),
                ),
                Positioned(child: Column(
                  children: [
                    Icon(Icons.production_quantity_limits,size: 40,),
                    Text("Stock \n"
                        "${widget.count} pcs",style: TextStyle(fontSize: 20),)
                  ],
                ),)]
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Description :",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.des,textAlign: TextAlign.justify,style: GoogleFonts.aBeeZee(fontSize: 20),),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(text: 'Price: \$ ${widget.amnt}',style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold,color: Colors.redAccent
                      ),
                        children: [
                          TextSpan(
                            text: ' ₹9999 ',style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),
                          ),
                          TextSpan(
                            text: '\n Offer 50% ',style: TextStyle(color:Colors.black,fontSize: 20,decoration: TextDecoration.lineThrough,backgroundColor: Colors.red.withOpacity(.5)),
                          ),
                        ]
                      ),

                    ),
                  ),

                ],
              ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: RatingBar.builder(
            initialRating:double.parse(widget.Rating ),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {

            },
          ),
      ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Quantity",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(height: 70,
                  width: 200,
                  child: NumberInputWithIncrementDecrement(


                    controller: TextEditingController(),
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                    min: 1,
                    incIconSize: 30,
                    decIconSize: 30,

                    max: 50,
                    incIcon: Icons.add_circle_outline_outlined,
                    decIcon: Icons.exposure_minus_1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                    flex:2,child: Row(
                  children: [
                    Container(
                        height: 70,
                        width: 200,
                        child: ElevatedButton(onPressed: (){


                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Cart(image:widget.image ,title:widget.title,price: widget.price,id: widget.id,)
                          ));
                        }, child: Text("ADD TO CART",style: TextStyle(fontSize: 20,color: Colors.black),),
                          style: ElevatedButton.styleFrom(primary: Colors.red),)),
                    Spacer(),
                    Container(
                        height: 70,
                        width: 200,
                        child: ElevatedButton(onPressed: (){}, child: Text("BUY NOW",style: TextStyle(fontSize: 20,color: Colors.black),),
                        style: ElevatedButton.styleFrom(primary: Colors.red),)),

                  ],
                )),
              ),
              Divider(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("More Items ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 800,
                  width: double.infinity,



                  child:FutureBuilder<List<CheckImg>>(
                    future: Imgdetails(),
                    builder: (context,  snapshot) {
                      if (snapshot.hasData) {

                        return  Container(
                          height: 300,
                          width: double.infinity,



                          child: ListView.builder(

                            itemCount: menmg.length,
                            scrollDirection: Axis.vertical,

                            itemBuilder: (BuildContext context,int index){
                              return ListTile(
                                  visualDensity: VisualDensity(vertical: 4),


                                  title: Row(
                                    children: [
                                      Container(
                                        height: 200,
                                        width: 200,
                                        child: Image.network(snapshot.data![index].image.toString()),
                                        decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:BorderRadius.circular(10),

                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(


                                              child: Column(
                                                  children: [
                                                  Text("\$ ${snapshot.data![index].price.toString()}",style:GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.black),fontSize: 25)),
                                              Text(snapshot.data![index].category.toString(),style:GoogleFonts.abhayaLibre(textStyle:  TextStyle(color:Colors.black),fontSize: 19)),
                                    ],
                                  )),
                              ),
                              ],
                              ) ,

                              trailing: Padding(
                              padding: const EdgeInsets.only(top: 70),
                              child: Icon(Icons.arrow_forward,),
                              ),
                              );

                            },

                          ),
                        );}


                      else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),




            ],
          ),
        ),
      ),

    );
  }
}
