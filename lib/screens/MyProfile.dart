import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';

class MyProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Image.asset("assets/logo.png", fit: BoxFit.cover),
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
                    child: HtmlWidget("""<h2 style='color:red;'>My Profile</h2>"""),
                  ),
                  Card(
                    child: InkWell(
                        splashColor: Colors.redAccent.withAlpha(30),

                        child: Container(
                          width: 400,
                          //height: 140,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: new Column(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(left: 15, top: 25, right: 15),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Name :',
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                                      ),
                                      Text('R.S.M.Premathilaka',
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 15, top: 25, right: 15),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Address :',
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                                      ),
                                      Text('No.35, Kotawila, Kamburugamuwa',
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 15, top: 25, right: 15),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Branch :',
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                                      ),
                                      Text('Malabe',
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 15, top: 25, right: 15),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Accounts :',
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 25),
                                  alignment: Alignment.center,
                                  child: Table(
                                    border: TableBorder.all(),
                                    children: [
                                      TableRow(
                                          children: [
                                            Text('Account', textAlign: TextAlign.center,
                                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                                            ),
                                            Text('Balance', textAlign: TextAlign.center,
                                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                                            ),
                                          ]
                                      ),
                                      TableRow(
                                          children: [
                                            Text('Savings', textAlign: TextAlign.center,
                                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.black),
                                            ),
                                            Text('1200.00 LKR', textAlign: TextAlign.center,
                                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.black),
                                            ),
                                          ]
                                      ),
                                      TableRow(
                                          children: [
                                            Text('Current', textAlign: TextAlign.center,
                                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.black),
                                            ),
                                            Text('3000.00 LKR', textAlign: TextAlign.center,
                                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.black),
                                            ),
                                          ]
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    ),

                  ),
                ],
              )
            )
        )
    );
  }

}