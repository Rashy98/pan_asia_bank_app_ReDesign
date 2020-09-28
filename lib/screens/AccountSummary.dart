import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:fancy_dialog/fancy_dialog.dart';

class AccountSummary extends StatelessWidget {

  static BuildContext buildContext;

  List<Widget> containers = [
     Container(
        margin: const EdgeInsets.only(top: 20.0),
         child: Center(
           child: Align(
             alignment: Alignment.topCenter,
             child: Card(
                 child: InkWell(
                   splashColor: Colors.redAccent.withAlpha(30),
                   onTap: (){
                     _displayDialog(buildContext);
                   },
                   child: Container(
                     width: 380,
                     height: 140,
                     child: Align(
                       alignment: Alignment.centerLeft,
                       child: new Column(
                         children : <Widget>[
                           Container(
                             margin: const EdgeInsets.only(left: 25, top: 25, right: 25),
                             alignment: Alignment.centerLeft,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text('Account Number',
                                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                                   ),
                                 Text('12345678',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                                 )
                               ],
                             ),
                           ),
                           Container(
                             margin: const EdgeInsets.only(left: 25, top: 15, right: 25),
                             alignment: Alignment.centerLeft,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text('Available Amount',
                                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                                   ),
                                 Text('LKR 1200.00',
                                   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.blueAccent),
                                 ),
                               ],
                             ),
                           ),
                           Container(
                             margin: const EdgeInsets.only(right: 25, top: 15),
                             alignment: Alignment.centerRight,
                             child: Text('Active',
                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.blueAccent),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
             ),
           ),
         )
     ),
    Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: InkWell(
                splashColor: Colors.redAccent.withAlpha(30),
                onTap: (){
                  _displayDialog(buildContext);
                },
                child: Container(
                  width: 380,
                  height: 140,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: new Column(
                      children : <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 25, top: 25, right: 25),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Account Number',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                              ),
                              Text('12345678',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),)
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 25, top: 15, right: 25),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Available Amount',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                              Text('LKR 1200.00',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.blueAccent),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 25, top: 15),
                          alignment: Alignment.centerRight,
                          child: Text('Inactive',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
    )
  ];

  static _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 360,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                        height: 60,
                        width: 350,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(color:  Colors.red)
                            ]
                        ),
                        child:Center(
                            child:Text("Bill Payment",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center)
                        )
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 25, top: 25, right: 25),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Account Number',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                          ),
                          Text('12345678',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25, top: 15, right: 25),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Account Name',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                          ),
                          Text('R.S.M. Premathilaka',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25, top: 15, right: 25),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Lien Amount',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                          ),
                          Text('LKR 00.00',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25, top: 15, right: 25),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Float Balance',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                          ),
                          Text('LKR 00.00',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25, top: 15, right: 25),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Available Amount',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                          ),
                          Text('LKR 1200.00',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 100, top : 20),
                        child: ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ButtonTheme(
                                minWidth: 130,
                                child:RaisedButton(
                                  child: new Text('CANCEL'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    side: BorderSide(color: Colors.red),

                                  ),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  onPressed: ()=>Navigator.pop(context),
                                )),

                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static dialog(){
//    return showDialog(
//        context: buildContext,
//        builder: (BuildContext context) => FancyDialog(
//          gifPath: FancyGif.SUBMIT,
//          title: "Fancy Gif Dialog",
//          descreption: "This is descreption for fancy gif,you can load any image or gif to be displayed :), and you can choose between two themes Fancy and Flat",
//        )
//    );
    return showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What do you want to remember?'),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        );
  }

  @override
  Widget build(BuildContext context) {

    buildContext = context;
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Image.asset("assets/logo.png", fit: BoxFit.cover),
          bottom: TabBar(
            indicatorColor: Colors.red,
            tabs: <Widget>[
              Tab(
                text: 'Savings A/C',
              ),
              Tab(
                text: 'Current A/C',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: containers,
        ),
      ),
    );
  }
  
  
}