import 'package:e_comercesara/model/CateClass.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
            child:ListView.builder(
                  itemCount: 100,
                  itemBuilder:(context, index)
                  {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [


                          CircleAvatar(
                            radius: 50,
                            backgroundImage:AssetImage("asset/vg.JPG"),

                          ),
                          Text("data")
                        ],
                      ),
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
