import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comercesara/model/CateClass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'navigation.dart';
class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  final String uid = FirebaseAuth.instance.currentUser!.uid;
  List<Map<String,dynamic>> items =[];
  List catId =[];

  Future getCatId() async {
    List<Map<String,dynamic>> tempList =[];
    var data =await FirebaseFirestore.instance.collection('users').doc(uid).collection('products').get();
    await FirebaseFirestore.instance.collection('users').doc(uid).collection('products').get()
        .then((snapshot) =>snapshot.docs.forEach((element) {
      catId.add(element.reference.id);
      print(element.reference.id);

    }) );



    data.docs.forEach((element) {
      tempList.add(element.data());
    });
    setState(() {
      items=tempList;
      print(items);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.category_outlined),
        title: Text("Category"),
        backgroundColor: Colors.redAccent,

      ),
      body: Row(
        children: [

          Container(
            height: MediaQuery.of(context).size.height,
            width: 100,
            color: Colors.grey.withOpacity(.1),
            child: FutureBuilder(
                future: getCatId(),
                builder: (context,snapshot) {

                    return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context,index) {
                          return
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [


                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:NetworkImage(items[index]['image'].toString()),

                                  ),
                                  Text(items[index]['category'].toString())
                                ],
                              ),
                            );


                        }
                    );



                }
            ),


            ),

          Container(
            height: MediaQuery.of(context).size.height,
            width: 350,
            color: Colors.grey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("men",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,width: double.infinity,


                        child: ListView.builder(

                          shrinkWrap: true,

                          itemCount: menmg.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext,index )
                          {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child:Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),


                                  image: DecorationImage(image: NetworkImage(menmg[index].image),
                                      fit: BoxFit.fill),
                                ),


                              ),
                            );
                          },

                        ),
                      ),
                    ),
                    Text("Women",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,width: double.infinity,


                        child: ListView.builder(

                          shrinkWrap: true,

                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext,index )
                          {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child:Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,

                                  image: DecorationImage(image: AssetImage("asset/vg.JPG"),
                                      fit: BoxFit.fill),
                                ),


                              ),
                            );
                          },

                        ),
                      ),
                    ),
                    Text("Beauty and Personal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,width: double.infinity,


                        child: ListView.builder(

                          shrinkWrap: true,

                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext,index )
                          {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child:Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,

                                  image: DecorationImage(image: AssetImage("asset/vg.JPG"),
                                      fit: BoxFit.fill),
                                ),


                              ),
                            );
                          },

                        ),
                      ),
                    ),
                    Text("Home and Living",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,width: double.infinity,


                        child: ListView.builder(

                          shrinkWrap: true,

                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext,index )
                          {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child:Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,

                                  image: DecorationImage(image: AssetImage("asset/vg.JPG"),
                                      fit: BoxFit.fill),
                                ),


                              ),
                            );
                          },

                        ),
                      ),
                    ),
                    Text("Sports and Fitness",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,width: double.infinity,


                        child: ListView.builder(

                          shrinkWrap: true,

                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext,index )
                          {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child:Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,

                                  image: DecorationImage(image: AssetImage("asset/vg.JPG"),
                                      fit: BoxFit.fill),
                                ),


                              ),
                            );
                          },

                        ),
                      ),
                    ),
                    Text("Electronics",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,width: double.infinity,


                        child: ListView.builder(

                          shrinkWrap: true,

                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext,index )
                          {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child:Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,

                                  image: DecorationImage(image: AssetImage("asset/vg.JPG"),
                                      fit: BoxFit.fill),
                                ),


                              ),
                            );
                          },

                        ),
                      ),
                    ),
                    Text("Automotive",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,width: double.infinity,


                        child: ListView.builder(

                          shrinkWrap: true,

                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext,index )
                          {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child:Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,

                                  image: DecorationImage(image: AssetImage("asset/vg.JPG"),
                                      fit: BoxFit.fill),
                                ),


                              ),
                            );
                          },

                        ),
                      ),
                    ),Text("Books",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,width: double.infinity,


                        child: ListView.builder(

                          shrinkWrap: true,

                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext,index )
                          {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child:Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,

                                  image: DecorationImage(image: AssetImage("asset/vg.JPG"),
                                      fit: BoxFit.fill),
                                ),


                              ),
                            );
                          },

                        ),
                      ),
                    ),Text("Musical Instrument",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,width: double.infinity,


                        child: ListView.builder(

                          shrinkWrap: true,

                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext,index )
                          {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child:Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,

                                  image: DecorationImage(image: AssetImage("asset/vg.JPG"),
                                      fit: BoxFit.fill),
                                ),


                              ),
                            );
                          },

                        ),
                      ),
                    ),Text("Other",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,width: double.infinity,


                        child: ListView.builder(

                          shrinkWrap: true,

                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext,index )
                          {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child:Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,

                                  image: DecorationImage(image: AssetImage("asset/vg.JPG"),
                                      fit: BoxFit.fill),
                                ),


                              ),
                            );
                          },

                        ),
                      ),
                    ),








                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
