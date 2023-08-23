

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamBuilder subscription;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) async{

    if (connectivityResult == ConnectivityResult.none) {
      // Get.rawSnackbar(
      //     messageText: const Text(
      //         'PLEASE CONNECT TO THE INTERNET',
      //         style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 14
      //         )
      //     ),
      //     isDismissible: false,
      //     duration: const Duration(days: 1),
      //     backgroundColor: Colors.red[400]!,
      //     icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
      //     margin: EdgeInsets.zero,
      //     snackStyle: SnackStyle.GROUNDED
      // );
      Get.dialog(
          WillPopScope(
                        onWillPop: () async { return false; },
                         child: CupertinoAlertDialog(
                           title: Text("NO INTERNET"),
                           content: Text("Please check internet connection"),
                           actions: [
                             CupertinoButton(
                                 child: Text("Retry"), onPressed: (){


                             })
                           ],

                         ),
                       )
      );

    } else {
      if (connectivityResult!=ConnectivityResult.none) {
        Get.back();
      }
    }
  }
}
































// import 'dart:async';
//
// import 'package:e_comercesara/Login.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// class Connectionchecker extends StatefulWidget {
//   const Connectionchecker({super.key});
//
//   @override
//   State<Connectionchecker> createState() => _ConnectioncheckerState();
// }
//
// class _ConnectioncheckerState extends State<Connectionchecker> {
//
//   late ConnectivityResult result;
//   late StreamSubscription subscription;
//   var isConnected=false;
//
//   @override
//   void initState(){
//     super.initState();
//     StartStreaming();
//   }
//
//
//
//
//
//   checkInternet() async{
//     result=await Connectivity().checkConnectivity();
//     if(result!=ConnectivityResult.none)
//       {
//       isConnected=true;
//       Navigator.push(context,MaterialPageRoute(builder: (context) => const Login()),);
//
//       }
//     else
//     {
//       isConnected=false;
//       showDialogBox();
//     }
//     setState(() {});
//
//   }
//   showDialogBox(){
//
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (context)=>
//             WillPopScope(
//               onWillPop: () async { return false; },
//               child: CupertinoAlertDialog(
//                 title: Text("NO INTERNET"),
//                 content: Text("Please check internet connection"),
//                 actions: [
//                   CupertinoButton(
//                       child: Text("Retry"), onPressed: (){
//                     Navigator.pop(context);
//                     checkInternet();
//                   })
//                 ],
//
//               ),
//             )
//
//     );
//   }
//
//
//   StartStreaming(){
//     subscription=Connectivity().onConnectivityChanged.listen((event) async {
//       checkInternet();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Check Internet Connection",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
//       ),
//     );
//
//   }
// }
