import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:e_comercesara/youtubeplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:http/http.dart' as http;

import 'Description.dart';
import 'model/CateClass.dart';
import 'model/EcomClass.dart';
class Pageone extends StatefulWidget {
  const Pageone({super.key});

  @override
  State<Pageone> createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {

  List list = [ '' ];




  Future<List<CheckImg>> Imgdetails() async{
    var res=await http.get(Uri.parse("https://fakestoreapi.com/products"));
    List data=jsonDecode(res.body);

    return data.map((e) =>CheckImg.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:NestedScrollView(


        headerSliverBuilder:(BuildContext context, bool innerBoxIsScrolled)
        {
          return[
            SliverAppBar(
              backgroundColor:Colors.transparent,
              shadowColor: Colors.lightBlueAccent,
              excludeHeaderSemantics: true,

              floating: true,
              automaticallyImplyLeading: false,
              // snap: true,


              pinned: false,

              toolbarHeight: 100,
              leading: Icon(Icons.add_shopping_cart,size: 30,color: Colors.red,),


              foregroundColor: Colors.white,
              flexibleSpace:  FlexibleSpaceBar(
                title: GFSearchBar(
                  searchBoxInputDecoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    hintText: "Search here.....",
                    suffixIcon: Icon(Icons.search),

                  ),

                  searchList: list,
                  overlaySearchListItemBuilder: (item) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  },
                  searchQueryBuilder:  (query, list) {
                    return list
                        .where((item) =>
                        item.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                  },
                  onItemSelected:  (item) {
                    setState(() {
                      print('$item');
                    });
                  },),
              ),



            )
          ];
        },
        body:Container(height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(" Deals of the Day",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      Spacer(),


                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:FutureBuilder<List<CheckImg>>(
    future: Imgdetails(),
    builder: (context,  snapshot) {
    if (snapshot.hasData) {

    return  Container(
                    height: 300,
                    width: double.infinity,



                    child: ListView.builder(
                      shrinkWrap: true,

                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext,index )
                      {
                        return Container(
                          height: 200,
                          width: 200,

                          decoration: BoxDecoration(
                            color: Colors.transparent,



                            borderRadius: BorderRadius.circular(10),
                          ),


                          child: GestureDetector(
                            onTap:(){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DetailsPage(
                                  snapshot.data![index].rating!.count.toString(),

                                  snapshot.data![index].description.toString(),
                                  snapshot.data![index].rating!.rate.toString(),
                                  snapshot.data![index].price.toString(),
                                  snapshot.data![index].image.toString(),
                                  snapshot.data![index].price.toString(),
                                  snapshot.data![index].title.toString(),
                                  snapshot.data![index].id.toString(),


                                )),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(snapshot.data![index].image.toString(),fit: BoxFit.fill,),
                            ),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(" Best Selling...",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      Spacer(),
                      // AnimatedTextKit(
                      //   animatedTexts: [
                      //     WavyAnimatedText('More >',textStyle: TextStyle(fontWeight: FontWeight.bold)),
                      //
                      //
                      //   ],
                      //   isRepeatingAnimation: true,
                      //   totalRepeatCount: 100,
                      //   stopPauseOnTap: true,
                      //   onTap: ()  {
                      //     Navigator.push(context,
                      //         PageTransition(child: Ottmore(), type: PageTransitionType.rightToLeft));
                      //
                      //
                      //
                      //   },
                      // ),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:FutureBuilder<List<CheckImg>>(
                    future: Imgdetails(),
                    builder: (context,  snapshot ) {
                      if (snapshot.hasData) {

                        return Container(
                        height: 200,
                        width: double.infinity,
                        child: Swiper(
                          autoplay: true,
                          autoplayDisableOnInteraction: false,
                          duration: 2,
                          itemBuilder: (BuildContext context,int index){
                            return Stack(children:[ Image.network(snapshot.data![index].image.toString(),),
                            Positioned(
                                right: 30,
                                child:  Text("Upto ${snapshot.data![index].rating!.count.toString()}%offer",style: TextStyle(backgroundColor: Colors.redAccent,fontSize: 20),))]);
                          },
                          itemCount: snapshot.data!.length,
                          pagination: SwiperPagination(),
                          control: SwiperControl(),

                          viewportFraction: 0.8,
                          scale: 0.9,

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
                Divider(),

                Container(
                  height: 100,
                  child: Youtube( url: 'tpx6hSnTMPs'),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 500,
                    width: double.infinity,



                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        // physics: NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            mainAxisExtent: 200,

                            childAspectRatio: 5/4.9,
                            crossAxisSpacing: 10,

                            mainAxisSpacing:2),
                        shrinkWrap: true,
                        itemCount: menmg.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(1.0),

                                child: Container(
                                  height: 150,

                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(

                                      image: NetworkImage(menmg[index].image),fit: BoxFit.fill,),),


                                ),
                              ),
                              SizedBox(height: 20,
                                child: Text("ddata",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),




                            ],
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Youtube( url: 'Ax09Mrn200s'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,

                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,

                            childAspectRatio: 3/4,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        shrinkWrap: true,
                        itemCount: menmg.length,


                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(image: AssetImage(menmg[index].image),fit: BoxFit.fill,),),


                          );
                        }
                    ),
                  ),
                ),





              ],
            ),
          ),

        ),),
    );
  }

}
