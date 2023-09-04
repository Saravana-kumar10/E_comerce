import 'package:e_comercesara/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  late bool logb;

  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(


                  height: 200,
                  width: 450,
                  child:  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.person_pin_sharp,size: 100,),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(height: 40,width: 200,
                          child: OutlinedButton(
                              onPressed:(){},
                              child: Text("Edit",style: TextStyle(fontSize: 20,color: Colors.red),),
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.greenAccent.withOpacity(.2)),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ),
              Container(
                height: 800,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons.luggage,size: 30,),
                          title: Text("My Order",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          subtitle: Text("View,Track order",style: TextStyle(fontSize: 20),),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons.currency_pound_outlined,size: 30,),
                          title: Text("Offer Coupns",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          subtitle: Text("Buy & Use Coupns",style: TextStyle(fontSize: 20),),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons.credit_card,size: 30,),
                          title: Text("Credit Points",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          subtitle: Text("View credit Points",style: TextStyle(fontSize: 20),),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons.help_rounded,size: 30,),
                          title: Text("Help",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          subtitle: Text("Any Enquries & Complaints",style: TextStyle(fontSize: 20),),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons.settings,size: 30,),
                          title: Text("Account Settings",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          subtitle: Text("Payment & other...",style: TextStyle(fontSize: 20),),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons.language_outlined,size: 30,),
                          title: Text("Change Language",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          subtitle: Text("",style: TextStyle(fontSize: 20),),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder:(BuildContext context)
                              {
                                return AlertDialog(
                                  title: new Text('Are you sure?'),
                                  content: new Text('Do you want to Log out'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
                                      child: new Text('No',style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
                                    ),
                                    TextButton(
                                      onPressed: () {


                                        FirebaseAuth.instance.signOut();
                                        Navigator.of(context).pop();
                                      }, // <-- SEE HERE
                                      child: new Text('Yes',style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
                                    ),
                                  ],
                                );
                              },
                            );


                          },
                          child: ListTile(
                            leading: Icon(Icons.logout,size: 30,),
                            title: Text("Log Out",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                            subtitle: Text("",style: TextStyle(fontSize: 20),),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
