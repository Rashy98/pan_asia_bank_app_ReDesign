import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;

import 'package:fancy_dialog/fancy_dialog.dart';

class PaymentHistory extends StatelessWidget {
  static BuildContext buildContext;



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Image.asset("assets/logo.png", fit: BoxFit.cover),
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: HtmlWidget(
                            """<h2 style='color:red;'>Payment History</h2>"""),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 50),
                        child:
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '18-08-2020'),
                        ),),
                      Container(
                          height: 110,
                          width: 400,
                          margin: const EdgeInsets.all(8.0),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                showDialog2(context);
                              },
                              child: Card(
                                child: Column(children: <Widget>[
                                  new Container(
                                      decoration: new BoxDecoration(
                                          color:
                                          Color.fromRGBO(38, 227, 0, 200)),
                                      child:Column(children: [
                                        ListTile(

                                          title: Text("0771234562",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text("DIALOG MOBILE \nAPPROVED"),

                                          trailing: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],)
                                      ),
                                  Align(
                                      alignment: Alignment(0.9, 10),
                                      child: Text("LKR     100.00",
                                          style: TextStyle(

                                              fontWeight: FontWeight.bold,
                                              fontSize: 15))),
                                  Align(
                                      alignment: Alignment(0.9, 10),
                                      child: Text("2020-AUG-18",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12)))
                                ]),
                              ),
                            ),
                          )),
                      Container(
                          height: 110,
                          width: 400,
                          margin: const EdgeInsets.all(8.0),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                showDialog2(context);
                              },
                              child: Card(
                                child: Column(children: <Widget>[
                                  new Container(
                                      decoration: new BoxDecoration(
                                          color:
                                          Color.fromRGBO(38, 227, 0, 200)),
                                      child:Column(children: [
                                        ListTile(

                                          title: Text("11829338291193",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text("CEB Bill \nAPPROVED"),

                                          trailing: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],)
                                  ),
                                  Align(
                                      alignment: Alignment(0.9, 10),
                                      child: Text("LKR     3000.00",
                                          style: TextStyle(

                                              fontWeight: FontWeight.bold,
                                              fontSize: 15))),
                                  Align(
                                      alignment: Alignment(0.9, 10),
                                      child: Text("2020-AUG-18",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12)))
                                ]),
                              ),
                            ),
                          )),

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 50),
                        child:
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '16-08-2020'),
                        ),),
                      Container(
                          height: 110,
                          width: 400,
                          margin: const EdgeInsets.all(8.0),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                showDialog2(context);
                              },
                              child: Card(
                                child: Column(children: <Widget>[
                                  new Container(
                                      decoration: new BoxDecoration(
                                          color:
                                          Color.fromRGBO(255, 23, 0, 140)),
                                      child:Column(children: [
                                        ListTile(

                                          title: Text("0771234562",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text("DIALOG MOBILE \nREJECTED"),

                                          trailing: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],)
                                  ),
                                  Align(
                                      alignment: Alignment(0.9, 10),
                                      child: Text("LKR     100.00",
                                          style: TextStyle(

                                              fontWeight: FontWeight.bold,
                                              fontSize: 15))),
                                  Align(
                                      alignment: Alignment(0.9, 10),
                                      child: Text("2020-AUG-18",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12)))
                                ]),
                              ),
                            ),
                          )),



                    ])))
    );
  }

  Future showDialog2(context) {
    return showDialog(
      context: context,
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        child: Container(
          height: 480,
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
                        boxShadow: [BoxShadow(color: Colors.red)]),
                    child: Center(
                        child: Text(
                          "Summary",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ))),
                Container(
                    margin: EdgeInsets.only(left: 20, right: 50),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: 16),
                          hintText: 'Account Number'),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 50),
                  child: Text("87376694",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Transaction Reference Number'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 25, right: 50),
                    child: Text("RB1001200301032",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Amount'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 25, right: 50),
                    child: Text("LKR.3000",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Fund Transfer Remark'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 25, right: 50),
                    child: Text("August Monthly Allowance",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Date'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 25, right: 50),
                    child: Text("2020-July-01",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),

                Container(
                    margin: EdgeInsets.only(left: 90),
                    child: ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 130,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: BorderSide(color: Colors.teal),
                            ),
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text('OK'),
                            onPressed: ()=> Navigator.of(context).pop(),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
