import 'dart:async';
import 'dart:collection';


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_comercesara/Cart.dart';
import 'package:e_comercesara/Cattegory.dart';
import 'package:e_comercesara/Page0ne.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


import 'Profile.dart';
class Navi extends StatefulWidget {
  const Navi({super.key});

  @override
  State<Navi> createState() => _NaviState();
}

class _NaviState extends State<Navi> {
///internet connection
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected=true;

  @override
  void initState(){
    StartStreaming();
    super.initState();

  }





  checkInternet() async{
    result=await Connectivity().checkConnectivity();
    if(result!=ConnectivityResult.none)
    {
      isConnected=true;


    }
    else
    {
      isConnected=false;
      showDialogBox();
    }
    setState(() {});

  }
  showDialogBox(){

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context)=>
            WillPopScope(
              onWillPop: () async { return false; },
              child: CupertinoAlertDialog(
                title: Text("NO INTERNET"),
                content: Text("Please check internet connection"),
                actions: [
                  CupertinoButton(
                      child: Text("Retry"), onPressed: (){
                    Navigator.pop(context);
                    checkInternet();
                  })
                ],

              ),
            )

    );
  }


  StartStreaming(){
    subscription=Connectivity().onConnectivityChanged.listen((event) async {
       checkInternet();
    });
  }



  int Index=0;

  final ListQueue<int> _navigation =ListQueue();
  final pages = [
  Pageone(),
    Category(),
    Cart(image:"", title: "", price: "", id: ""),

    Profile(),

  ];
  Future<bool> _onWillPop() async {
    if(Index==0) {
      return (await showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //<-- SEE HERE
                  child: new Text('No',style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  // <-- SEE HERE
                  child: new Text('Yes',style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
                ),
              ],
            ),
      ));
    }
    else{   setState(() {
      _navigation.removeLast();
      int position =_navigation.isEmpty ? 0: _navigation.last;
      Index=position;
    });}
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:_onWillPop,
      child: Scaffold(
        body:isConnected? pages.elementAt(Index):Center(child:Image(image: AssetImage("asset/net.jpg"),fit: BoxFit.fill,),),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(

                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.redAccent,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: Icons.home_filled,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.category,
                    text: 'Category',
                  ),
                  GButton(
                    icon: Icons.shopping_cart,
                    text: 'Cart',
                  ),
                  GButton(
                    icon: Icons.person_pin,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: Index,
                onTabChange: (index) {
                  setState(() {
                    Index = index;
                  });

                },

              ),
            ),
          ),
        ),
      ),
    );
  }

}
