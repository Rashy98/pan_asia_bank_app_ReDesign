import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;

import 'package:fancy_dialog/fancy_dialog.dart';

class PaymentHistory extends StatefulWidget{
  @override
  _PaymentHistory createState() => _PaymentHistory();

}
class _PaymentHistory extends State<PaymentHistory> {
  static BuildContext buildContext;

  @override
  void initState() {
    _fetchUser();
  }



  List users = List();
  var isLoading = true;

  void _fetchUser() async{
    final response =  await http.get("https://uee-pan-backend.herokuapp.com/user/");
    if (response.statusCode == 200) {
      users = json.decode(response.body) as List;
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
  List<Widget> listArray = [];

  _returnHistory(){
    if(users.length != 0 && users.length != null) {
      print("users:" + users.length.toString());
      for (var x = 0; x <= users.length; x++) {
        if (users[x]['_id'] == "5f7094ced1c8261f4f9b756f") {
          for (var y = 0; y < users[x]['BillPaymentHistory'].length; y++) {
            if( users[x]['BillPaymentHistory'][y] == null) {
              y++;
            }
            else{
              if(users[x]["BillPaymentHistory"][y]["ServiceProName"] != null) {
                print("history : " + y.toString() + " -->" +
                    users[x]['BillPaymentHistory'][y].toString());
                listArray.add( new Container(
                    height: 120,
                    width: 400,
                    margin: const EdgeInsets.all(8.0),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          showDialog2(context,users[x]["BillPaymentHistory"][y]["refNo"],users[x]["BillPaymentHistory"][y]["ServiceProName"],users[x]["BillPaymentHistory"][y]["Amount"]);
                        },
                        child: Card(
                          child: Column(children: <Widget>[
                            new Container(
                                decoration: new BoxDecoration(
                                    color:
                                    Color.fromRGBO(38, 227, 0, 200)),
                                child:Column(children: [
                                  ListTile(

                                    title: Text(users[x]["BillPaymentHistory"][y]["refNo"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(users[x]["BillPaymentHistory"][y]["ServiceProName"]),

                                    trailing: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],)
                            ),
                            Align(
                                alignment: Alignment(0.9, 10),
                                child: Text("LKR     "+users[x]["BillPaymentHistory"][y]["Amount"],
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
                    )));
              }
              else{
                listArray.add(

                    new Container(
                          height: 120,
                          width: 400,
                          margin: const EdgeInsets.all(8.0),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                showDialog2(context,users[x]["BillPaymentHistory"][y]["refNo"],users[x]["BillPaymentHistory"][y]["merchant"],users[x]["BillPaymentHistory"][y]["Amount"]);
                              },
                              child: Card(
                                child: Column(children: <Widget>[
                                  new Container(
                                      decoration: new BoxDecoration(
                                          color:
                                          Color.fromRGBO(38, 227, 0, 200)),
                                      child:Column(children: [
                                        ListTile(

                                          title: Text(users[x]["BillPaymentHistory"][y]["refNo"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(users[x]["BillPaymentHistory"][y]["merchant"]),

                                          trailing: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],)
                                      ),
                                  Align(
                                      alignment: Alignment(0.9, 10),
                                      child: Text("LKR     "+users[x]["BillPaymentHistory"][y]["Amount"],
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
                          )));
//                    new ListTile(
//                  title: Text(users[x]["BillPaymentHistory"][y]["refNo"]),
//                  subtitle: Text(
//                      users[x]["BillPaymentHistory"][y]["merchant"]),
//                  trailing: Icon(
//                    Icons.keyboard_arrow_right,
//                    color: Colors.green,
//                  ),
//                ));
              }
            }
          }
          break;
        }
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    _returnHistory();

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
                                  Card(
                                    child: Column(
                                        children: isLoading? [CircularProgressIndicator()]:listArray
                                    ),
                                  ),

                                ]),
                              ),
                            ),
                          );




//                    ])))
//    );
  }

  Future showDialog2(context,refNo,sProv,amount) {
    return showDialog(
      context: context,
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        child: Container(
          height: 420,
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
                          hintText: 'Service Provider'),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 50),
                  child: Text(sProv,
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Reference Number'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 25, right: 50),
                    child: Text(refNo,
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
                    child: Text("LKR. "+amount,
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
