import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_comercesara/Cart.dart';

import 'package:e_comercesara/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Imagetransition.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool logcon= false;
  bool signcon= false;
  final gkey= GlobalKey<FormState>();
  TextEditingController txtpwd =new TextEditingController();
  TextEditingController txtlog =new TextEditingController();
  TextEditingController pwd =new TextEditingController();
  TextEditingController rpwd =new TextEditingController();
  Color grey= Colors.grey;
  // late SharedPreferences logindata ;
  // late bool logbool;
  //
  //
  //
  //
  //
  // @override
  // void initState(){
  //   super.initState();
  //
  //
  // }











  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ return false; },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body:
                      Stack(
          children:[
           Positioned(

             child: Container(

                 height: double.infinity,width: double.infinity,
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                     image: DecorationImage(image:NetworkImage("https://cliply.co/wp-content/uploads/2019/05/371905230_ECOMMERCE_400px.gif"),fit: BoxFit.fill)
                 ),

                 child: SingleChildScrollView(
                   child: Column(

                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 20,left: 50,right: 50,bottom: 10),
                         child: ListTile(
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20)
                           ),
                           tileColor: grey,

                           title: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                           subtitle: Text("Already a Customer.",style: TextStyle(fontSize: 20),),
                           leading: Radio(

                               value: " ",
                               groupValue: logcon,
                               onChanged: (value){
                                 setState(() {
                                   if(logcon==false)
                                   {logcon=true;}else logcon=false;
                                   signcon=false;
                                 });
                               }
                           ),
                         ),
                       ),
                       Visibility(
                           visible: logcon,
                           child:Form(
                             key: gkey,
                             child: Container(
                               height: 290,
                               width: 400,

                               decoration:BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 gradient: LinearGradient(
                                     begin: Alignment.topRight,
                                     end: Alignment.bottomLeft,
                                     colors: [
                                       Colors.white12,
                                       Colors.black26,
                                       Colors.white70,
                                       Colors.black26,

                                     ]),


                               ),
                               child: Column(
                                 children: [
                                   SizedBox(height: 20,),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: TextFormField(
                                         controller: txtlog,


                                         decoration: InputDecoration(


                                           errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                                           filled: true,
                                           fillColor: Colors.blueGrey.withOpacity(.5),
                                           border: OutlineInputBorder(

                                               borderRadius: BorderRadius.circular(10)),
                                           labelText: "Mail-id",
                                           prefixIcon: const Icon(Icons.password),
                                         ),
                                         keyboardType: TextInputType.emailAddress,

                                         validator: (value) {
                                           String? regx = r'\S+@\S+\.\S+';
                                           RegExp rgx = new RegExp(regx);

                                           if (value == null || value.isEmpty) {
                                             return 'Please enter  mail-id';
                                           } else if (!rgx.hasMatch(value)) {
                                             return 'Enter valid one';
                                           } else
                                             return null;
                                         }
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: TextFormField(
                                         controller: txtpwd,
                                         maxLines: 1,
                                         keyboardType: TextInputType.visiblePassword,
                                         decoration: InputDecoration(


                                           errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                                           filled: true,
                                           fillColor: Colors.blueGrey.withOpacity(.5),
                                           border: OutlineInputBorder(

                                               borderRadius: BorderRadius.circular(10)),
                                           labelText: "Password",
                                           prefixIcon: const Icon(Icons.password),
                                         ),
                                         validator: (value) {
                                           String? pdkey=r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)';
                                           RegExp pkey = new RegExp(pdkey);
                                           if (value == null || value.isEmpty  ) {
                                             return 'Please enter some text';
                                           }
                                           else if (value.length <6) {
                                             return 'password must not be less than 6 char';
                                           }
                                           else if(value.length >=10)
                                           {
                                             return 'password must not more than 10';
                                           }
                                           else if(!pkey.hasMatch(value))
                                           { return 'enter a valid one';
                                           }
                                           return null;
                                         }

                                     ),
                                   ),
                                   SizedBox(height: 30,
                                     width: 120,
                                     child: ElevatedButton(onPressed: () {
                                       if(gkey.currentState!.validate())
                                       {
                                         // logindata.setBool("login", false);
                                         Navigator.pushReplacement(context,
                                             PageTransition(child: const Navi(), type: PageTransitionType.fade));


                                         ScaffoldMessenger.of(context).showSnackBar(

                                           const SnackBar(content: Text('Welcome Enjoy ur Day',style: TextStyle(color: Colors.white,fontSize: 20),)),


                                         );}
                                       txtlog.clear();
                                       txtpwd.clear();

                                     },
                                       child: const Center(child: Text("Log In",style: TextStyle(fontSize: 20,color: Colors.white60),)),
                                       style: ElevatedButton.styleFrom(backgroundColor: Colors.black.withOpacity(.5),),
                                     ),
                                   ),


                                 ],
                               ),


                             ),
                           )),
                       Padding(
                         padding: const EdgeInsets.only(top: 10,left: 50,right: 50,bottom: 10),
                         child: ListTile(
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20)
                           ),
                           tileColor: grey,

                           title: Text("Create an Account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                           subtitle: Text("New Customer.",style: TextStyle(fontSize: 20),),
                           leading: Radio(

                               value: " ",
                               groupValue: logcon,
                               onChanged: (value){
                                 setState(() {
                                   if(signcon==false)
                                   {signcon=true;}else signcon=false;
                                   logcon=false;
                                 });
                               }
                           ),
                         ),
                       ),
                       Visibility(
                           visible: signcon,
                           child:Form(
                             key: gkey,
                             child: Container(
                               height: 550,
                               width: 400,

                               decoration:BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 gradient: LinearGradient(
                                     begin: Alignment.topRight,
                                     end: Alignment.bottomLeft,
                                     colors: [
                                       Colors.white12,
                                       Colors.black26,
                                       Colors.white70,
                                       Colors.black26,

                                     ]),

                               ),
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: TextFormField(
                                         controller: txtlog,


                                         decoration: InputDecoration(


                                           errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                                           filled: true,
                                           fillColor: Colors.blueGrey.withOpacity(.5),
                                           border: OutlineInputBorder(

                                               borderRadius: BorderRadius.circular(10)),
                                           labelText: "Name",
                                           prefixIcon: const Icon(Icons.password),
                                         ),
                                         keyboardType: TextInputType.emailAddress,

                                         validator: (value) {
                                           String? regx = r'^[a-z A-Z]';
                                           RegExp rgx = new RegExp(regx);

                                           if (value == null || value.isEmpty) {
                                             return 'Please enter some text';
                                           } else if (!rgx.hasMatch(value)) {
                                             return 'use only alphabets';
                                           } else
                                             return null;
                                         }
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: TextFormField(
                                         controller: txtlog,


                                         decoration: InputDecoration(


                                           errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                                           filled: true,
                                           fillColor: Colors.blueGrey.withOpacity(.5),
                                           border: OutlineInputBorder(

                                               borderRadius: BorderRadius.circular(10)),
                                           labelText: "Mail-id",
                                           prefixIcon: const Icon(Icons.password),
                                         ),
                                         keyboardType: TextInputType.emailAddress,

                                         validator: (value) {
                                           String? regx = r'\S+@\S+\.\S+';
                                           RegExp rgx = new RegExp(regx);

                                           if (value == null || value.isEmpty) {
                                             return 'Please enter  mail-id';
                                           } else if (!rgx.hasMatch(value)) {
                                             return 'Enter valid one';
                                           } else
                                             return null;
                                         }
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: TextFormField(
                                         controller: txtpwd,
                                         maxLines: 1,
                                         keyboardType: TextInputType.visiblePassword,
                                         decoration: InputDecoration(


                                           errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                                           filled: true,
                                           fillColor: Colors.blueGrey.withOpacity(.5),
                                           border: OutlineInputBorder(

                                               borderRadius: BorderRadius.circular(10)),
                                           labelText: "Mobile number",
                                           prefixIcon: const Icon(Icons.password),
                                         ),
                                         validator: (value) {
                                           String? regx =  r'^(?:[+0]9)?[0-9]{10}$';
                                           RegExp rgx = new RegExp(regx);

                                           if (value == null || value.isEmpty) {
                                             return 'Please enter mob no';
                                           } else if (!rgx.hasMatch(value)) {
                                             return 'Number Incorrect';
                                           } else
                                             return null;
                                         }

                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: TextFormField(
                                         controller: txtpwd,
                                         maxLines: 1,
                                         keyboardType: TextInputType.visiblePassword,
                                         decoration: InputDecoration(


                                           errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                                           filled: true,
                                           fillColor: Colors.blueGrey.withOpacity(.5),
                                           border: OutlineInputBorder(

                                               borderRadius: BorderRadius.circular(10)),
                                           labelText: "Password",
                                           prefixIcon: const Icon(Icons.password),
                                         ),
                                         validator: (value) {
                                           String? regx = r'^[a-z A-Z]';
                                           RegExp rgx = new RegExp(regx);

                                           if (value == null || value.isEmpty) {
                                             return 'Please enter Password';
                                           } else if (!rgx.hasMatch(value)) {
                                             return 'Enter valid one';
                                           } else
                                             return null;
                                         }

                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: TextFormField(
                                         controller: txtpwd,
                                         maxLines: 1,
                                         keyboardType: TextInputType.visiblePassword,
                                         decoration: InputDecoration(


                                           errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                                           filled: true,
                                           fillColor: Colors.blueGrey.withOpacity(.5),
                                           border: OutlineInputBorder(

                                               borderRadius: BorderRadius.circular(10)),
                                           labelText: "Re-Password",
                                           prefixIcon: const Icon(Icons.password),
                                         ),
                                         validator: (value) {

                                           if (value == null || value.isEmpty) {
                                             return ' cannot be empty';
                                           } else if (pwd.text!=rpwd.text) {
                                             return 'Please re-enter password correctly';
                                           } else
                                             return null;
                                         }

                                     ),
                                   ),

                                   SizedBox(height: 30,
                                     width: 120,
                                     child: ElevatedButton(onPressed: () {
                                       if(gkey.currentState!.validate())
                                       {
                                         //logindata.setBool("login", false);


                                         ScaffoldMessenger.of(context).showSnackBar(

                                           const SnackBar(content: Text('Welcome Enjoy ur Day',style: TextStyle(color: Colors.white,fontSize: 20),)),


                                         );}
                                       txtlog.clear();
                                       txtpwd.clear();

                                     },
                                       child: const Center(child: Text("Log In",style: TextStyle(fontSize: 20,color: Colors.white60),)),
                                       style: ElevatedButton.styleFrom(backgroundColor: Colors.black.withOpacity(.5),),
                                     ),
                                   ),


                                 ],
                               ),


                             ),
                           )),
                       Padding(
                         padding: const EdgeInsets.only(top: 10,left: 50,right: 50,bottom: 10),
                         child:ElevatedButton(onPressed: (){
                           Navigator.pushReplacement(context,
                               PageTransition(child: const Navi(), type: PageTransitionType.fade));

                         }, child: Text("Go To Home")),
                       ),


                     ],
                   ),
                 )
             ),
           )
        ]
        )
                        ,
      ),
    );
  }




  // void log_check() async{
  //   logindata= await SharedPreferences.getInstance();
  //   logbool= logindata.getBool("login")??true;
  //   if(logbool==false)
  //   {
  //     Navigator.pushReplacement(context,
  //         PageTransition(child:  Navi(), type: PageTransitionType.fade));
  //   }
  //
  //
  // }
  // void dispose()
  // {
  // // logindata.remove("login");
  // super.dispose();
  // }





}

